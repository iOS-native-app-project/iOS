//
//  LoginViewController.swift
//  jaksim_ios
//
//  Created by 소영 on 2022/02/24.
//

import UIKit
import Alamofire
import AuthenticationServices
import KakaoSDKCommon
import KakaoSDKAuth
import KakaoSDKUser
import NaverThirdPartyLogin

class LoginViewController: UIViewController {

    @IBOutlet var kakaoLoginButton: UIButton!
    @IBOutlet var appleLoginButton: UIButton!
    @IBOutlet var naverLoginButton: UIButton!
    
    @IBOutlet var logoTextLabel: UILabel!
    
    let loginInstance = NaverThirdPartyLoginConnection.getSharedInstance()
    
    var logoText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginInstance?.delegate = self
        
        layoutSetup()
        
       
    }
    
    func layoutSetup() {
        
        logoTextLabel.text = "다같이 작심삼일 \n 동기부여 뿜뿜"
        
        let buttonList = [kakaoLoginButton, appleLoginButton, naverLoginButton]
        
        for button in buttonList {
            //button!.bounds.size.width = 335
            button!.bounds.size.height = 48
        }
        
        
    
    }

    
    @IBAction func kakaoButtonDidTab(_ sender: UIButton) {
        
        // 카카오톡 설치 여부 확인
        if (UserApi.isKakaoTalkLoginAvailable()) {
            UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                if let error = error {
                    print(error)
                    self.kakaoWebLogin()
                }
                else {
                    print("loginWithKakaoTalk() success.")

                    //do something
                    _ = oauthToken
                }
            }
        } else {
            kakaoWebLogin()
        }

    }
    
    @IBAction func appleButtonDidTab(_ sender: UIButton) {
        
        let request = ASAuthorizationAppleIDProvider().createRequest()
                request.requestedScopes = [.fullName,.email]
                let controller = ASAuthorizationController(authorizationRequests: [request])
                controller.delegate = self as? ASAuthorizationControllerDelegate
                controller.presentationContextProvider = self as? ASAuthorizationControllerPresentationContextProviding
                controller.performRequests()
    }
    
    @IBAction func naverButtonDidTab(_ sender: UIButton) {
        loginInstance?.requestThirdPartyLogin()
    }
    
    func kakaoWebLogin() {
        UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
            if let error = error {
                print(error)
            }
            else {
                print("loginWithKakaoAccount() success.")
                
                //do something
                _ = oauthToken
            }
        }
    }

    
}

extension LoginViewController: ASAuthorizationControllerDelegate {
    
    // Apple ID 연동 성공 시
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        switch authorization.credential {
        // Apple ID
        case let appleIDCredential as ASAuthorizationAppleIDCredential:
                
            // 계정 정보 가져오기
            let userIdentifier = appleIDCredential.user
            let fullName = appleIDCredential.fullName
            let email = appleIDCredential.email
                
            print("User ID : \(userIdentifier)")
            print("User Email : \(email ?? "")")
            print("User Name : \((fullName?.givenName ?? "") + (fullName?.familyName ?? ""))")
     
        default:
            break
        }
    }
        
    // Apple ID 연동 실패 시
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        print(error.localizedDescription)
    }
}

extension LoginViewController: NaverThirdPartyLoginConnectionDelegate {
    
    func oauth20ConnectionDidFinishRequestACTokenWithAuthCode() { // 로그인에 성공한 경우 호출
        print("Success login")
        getInfo()
    }
    
    func oauth20ConnectionDidFinishRequestACTokenWithRefreshToken() { // referesh token
        loginInstance?.accessToken
    }
    
    func oauth20ConnectionDidFinishDeleteToken() {  // 로그아웃
        print("log out")
    }
    
    func oauth20Connection(_ oauthConnection: NaverThirdPartyLoginConnection!, didFailWithError error: Error!) {
        print(error.localizedDescription)
    }
    
    func getInfo() {  // RESTful API, id가져오기
        guard let isValidAccessToken = loginInstance?.isValidAccessTokenExpireTimeNow() else { return }
        
        if !isValidAccessToken {
            return
        }
        
        guard let tokenType = loginInstance?.tokenType else { return }
        guard let accessToken = loginInstance?.accessToken else { return }
        
        let urlStr = "https://openapi.naver.com/v1/nid/me"
        let url = URL(string: urlStr)!
        
        let authorization = "\(tokenType) \(accessToken)"
        
        let req = AF.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: ["Authorization": authorization])
        
        req.responseJSON { response in
            guard let result = response.value as? [String: Any] else { return }
            guard let object = result["response"] as? [String: Any] else { return }
            guard let name = object["name"] as? String else { return }
            guard let email = object["email"] as? String else { return }
            guard let id = object["id"] as? String else {return}
            
            print(email)
            
        }
    }
    
    
}

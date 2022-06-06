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
import Kingfisher

class LoginViewController: UIViewController {
    @IBOutlet var kakaoLoginButton: UIButton!
    @IBOutlet var appleLoginButton: UIButton!
    @IBOutlet var naverLoginButton: UIButton!
    
    @IBOutlet var logoTextLabel: UILabel!
    
    lazy var dataManager = LoginDataManager()
    
    var token = ""
    var logoText = ""
    var loginAuthType = ""
    
    let naverLoginInstance = NaverThirdPartyLoginConnection.getSharedInstance()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        autoLogin()
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
    
    func autoLogin() {
        if UserDefaults.standard.string(forKey: "Token") != nil {
            print("자동로그인")
            
            let homeVC = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
            
            homeVC.modalPresentationStyle = .fullScreen
            self.present(homeVC, animated: false, completion: nil)
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
                    
                    self.token = oauthToken!.accessToken
                    self.loginAuthType = "KAKAO"
                    
                    let input: LoginRequest = LoginRequest(authType: self.loginAuthType, token: self.token)
                    
                    if self.token != "" {
                        self.dataManager.postLogin(parameters: input, viewController: self)
                    } else {
                        self.goToSignup()
                    }
                    
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
        naverLoginInstance?.delegate = self
        naverLoginInstance?.requestThirdPartyLogin()
    }
    
}


extension LoginViewController: NaverThirdPartyLoginConnectionDelegate, ASAuthorizationControllerDelegate {
    
    func kakaoWebLogin() {
        UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
            if let error = error {
                print(error)
            }
            else {
                print("loginWithKakaoAccount() success.")
                
                self.token = oauthToken!.accessToken
                self.loginAuthType = "KAKAO"
                
                let input: LoginRequest = LoginRequest(authType: self.loginAuthType, token: self.token)
                
                if self.token != "" {
                    print("token: \(self.token)")
                    self.dataManager.postLogin(parameters: input, viewController: self)
                } else {
                    self.goToSignup()
                }
                
                //do something
                _ = oauthToken
            }
        }
    }
    
    //MARK: - NAVER LOGIN
    
    func getNaverInfo() {
        
        guard let accessToken = naverLoginInstance?.isValidAccessTokenExpireTimeNow() else { return }
        
        if !accessToken { return }
        
        guard let tokenType = naverLoginInstance?.tokenType else { return }
        guard let accessToken = naverLoginInstance?.accessToken else { return }
        let requestUrl = "https://openapi.naver.com/v1/nid/me"
        let url = URL(string: requestUrl)!
        
        let authorization = "\(tokenType) \(accessToken)"
        
        let req = AF.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: ["Authorization": authorization])
        
        
        req.responseJSON { [self] response in
            guard let body = response.value as? [String: Any] else { return }
            
            if let resultCode = body["message"] as? String{
                if resultCode.trimmingCharacters(in: .whitespaces) == "success"{
                    let resultJson = body["response"] as! [String: Any]
                    
                    let name = resultJson["name"] as? String ?? ""
                    let id = resultJson["id"] as? String ?? ""
                    let phone = resultJson["mobile"] as? String ?? ""
                    let gender = resultJson["gender"] as? String ?? ""
                    let birthyear = resultJson["birthyear"] as? String ?? ""
                    let birthday = resultJson["birthday"] as? String ?? ""
                    let profile = resultJson["profile_image"] as? String ?? ""
                    let email = resultJson["email"] as? String ?? ""
                    let nickName = resultJson["nickname"] as? String ?? ""
                    
                    print("네이버 로그인 이름 ",name)
                    print("네이버 로그인 아이디 ",id)
                    print("네이버 로그인 핸드폰 ",phone)
                    print("네이버 로그인 성별 ",gender)
                    print("네이버 로그인 생년 ",birthyear)
                    print("네이버 로그인 생일 ",birthday)
                    print("네이버 로그인 프로필사진 ",profile)
                    print("네이버 로그인 이메일 ",email)
                    print("네이버 로그인 닉네임 ",nickName)
                    
                    self.token = self.naverLoginInstance!.accessToken!
                    self.loginAuthType = "NAVER"
                    
                    let input: LoginRequest = LoginRequest(authType: self.loginAuthType, token: self.token)
                    
                    if self.token != "" {
                        self.dataManager.postLogin(parameters: input, viewController: self)
                        print(token)
                    } else {
                        goToSignup()
                    }
                    
                } else {
                    print("정보가져오기 실패")
                    
                }
                
            }
            
        }
    }
    
    // 로그인 버튼을 눌렀을 경우 열게 될 브라우저
    func oauth20ConnectionDidOpenInAppBrowser(forOAuth request: URLRequest!) {
        
    }
    
    func oauth20ConnectionDidFinishRequestACTokenWithAuthCode() {
        print("네이버 로그인 성공")
        getNaverInfo()
        
    }
    func oauth20ConnectionDidFinishRequestACTokenWithRefreshToken() {
        print("네이버 토큰\(naverLoginInstance!.accessToken!)")
        
        getNaverInfo()
    }
    
    func oauth20ConnectionDidFinishDeleteToken() {
        naverLoginInstance?.requestDeleteToken()
        print("네이버 로그아웃")
        
    }
    
    func oauth20Connection(_ oauthConnection: NaverThirdPartyLoginConnection!, didFailWithError error: Error!) {
        print("에러 = \(error.localizedDescription)")
        
    }
    
    //MARK: - APPLE LOGIN
    
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

//MARK: - API
extension LoginViewController {
    func loginSuccess(_ result: LoginResponse) {
        KeyCenter.LOGIN_TOKEN = result.data.accessToken
        UserDefaults.standard.set(KeyCenter.LOGIN_TOKEN, forKey: "Token")
        
        let homeVC = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        
        homeVC.modalPresentationStyle = .fullScreen
        self.present(homeVC, animated: false, completion: nil)
        
        print(result.data.accessToken)
    }
    
    func goToSignup() {
        print(token)
        let signupVC = self.storyboard?.instantiateViewController(withIdentifier: "SignupViewController") as! SignupViewController
        signupVC.signupToken = token
        signupVC.loginAuthType = loginAuthType
        signupVC.modalPresentationStyle = .fullScreen
        self.present(signupVC, animated: true, completion: nil)
    }
    
    
}

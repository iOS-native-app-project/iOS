//
//  LoginViewController.swift
//  jaksim_ios
//
//  Created by 소영 on 2022/02/24.
//

import UIKit
import KakaoSDKCommon
import KakaoSDKAuth
import KakaoSDKUser

class LoginViewController: UIViewController {

    @IBOutlet var kakaoLoginButton: UIButton!
    @IBOutlet var appleLoginButton: UIButton!
    @IBOutlet var naverLoginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
    }
    
    @IBAction func naverButtonDidTab(_ sender: UIButton) {
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

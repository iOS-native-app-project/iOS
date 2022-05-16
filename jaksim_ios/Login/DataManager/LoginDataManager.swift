//
//  LoginDataManager.swift
//  jaksim_ios
//
//  Created by 소영 on 2022/03/20.
//

import Alamofire

class LoginDataManager {
    
    func postLogin(parameters: LoginInput, viewController: LoginViewController) {
        AF.request("\(Constant.shared.BASE_URL)auth/login", method: .post, parameters: parameters)
            .validate()
            .responseDecodable(of: LoginResponse.self) {response in
                switch response.result {
                case .success(let response):
                    if response.success {
                        viewController.loginSuccess(response)
                    }
                case .failure(let error):
                    if response.response?.statusCode == 401 {
                        print("토큰이 잘못되었습니다.")
                    } else if response.response?.statusCode == 404 {
                        viewController.goToSignup()
                        print("가입정보가 없습니다.")
                    }
                    print("서버연결x")
                    print(error.localizedDescription)
                }
                
            }
    }
    
    func postSignuUp(parameters: SignUpInput, viewController: SignupViewController) {
        AF.request("\(Constant.shared.BASE_URL)users", method: .post, parameters: parameters)
            .validate()
            .responseDecodable(of: LoginResponse.self) {response in
                switch response.result {
                case .success(let response):
                    if response.success {
                        print(response.statusCode)
                        if response.statusCode == 201 {
                            print("회원가입 성공")
                        } else {
                            print("회원가입 오류")
                        }
                
                    }
                case .failure(let error):
                    print("서버연결x")
                    print(error.localizedDescription)
                }
                
            }
    }
    
    
    
    
}

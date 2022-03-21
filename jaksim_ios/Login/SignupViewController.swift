//
//  SignupViewController.swift
//  jaksim_ios
//
//  Created by 소영 on 2022/03/16.
//

import UIKit
import SwiftUI
import Kingfisher

class SignupViewController: UIViewController {

    @IBOutlet var profileImageView: UIImageView!
    @IBOutlet var nickNameTextField: UITextField!
    
    @IBOutlet var allCheckButton: UIButton!
    @IBOutlet var ageCheckButton: UIButton!
    @IBOutlet var termsCheckButton: UIButton!
    @IBOutlet var individualCheckButton: UIButton!
    @IBOutlet var adCheckButton: UIButton!
    
    
    @IBOutlet var termsButton: UIButton!
    @IBOutlet var individualButton: UIButton!
    @IBOutlet var adButton: UIButton!
    
    @IBOutlet var signupButton: UIButton!
    
    let titleColor = UIColor.black
    let textColor = UIColor.darkGray
    var checkButtonList: [UIButton] = []
    
    var nickName = ""
    var signupToken = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nickNameTextField.delegate = self
        
        layoutSetup()
        
        print(signupToken)

    }
    
    func layoutSetup () {
        
        nickNameTextField.backgroundColor = .systemGray6
        
        checkButtonList.append(ageCheckButton)
        checkButtonList.append(termsCheckButton)
        checkButtonList.append(individualCheckButton)
        checkButtonList.append(adCheckButton)
        
    }
    
    func canSignup() {
        nickName = nickNameTextField.text!
        
        if (nickName != "") && (termsCheckButton.isSelected == true) && (individualCheckButton.isSelected == true) {
            signupButton.setImage(UIImage(named: "signup"), for: .normal)
            print(true)
        } else {
            signupButton.setImage(UIImage(named: "no_signup"), for: .normal)
            print(false)
        }
        
    }

    @IBAction func signupButtonDidTap(_ sender: UIButton) {
        signupButton.isSelected = !signupButton.isSelected
        
        nickName = nickNameTextField.text!
        
        let signupInput: SignUpInput = SignUpInput(authType: "NAVER", nickName: nickName, token: signupToken)
        
        print(signupInput)
        //dataManager.naverSignuUp(parameters: signupInput, viewController: self)
        
    }
    @IBAction func allCheckButtonDidTap(_ sender: UIButton) {
        allCheckButton.isSelected = !allCheckButton.isSelected
        
        for button in checkButtonList {
            if allCheckButton.isSelected == true {
                button.isSelected = true
            } else {
                button.isSelected = false
            }
        }
        
        canSignup()
    
    }
    @IBAction func ageCheckButtonDidTap(_ sender: UIButton) {
        ageCheckButton.isSelected = !ageCheckButton.isSelected
    }
    @IBAction func termsCheckButtonDidTap(_ sender: UIButton) {
        termsCheckButton.isSelected = !termsCheckButton.isSelected
        
        canSignup()
    }
    @IBAction func individualCheckButtonDidTap(_ sender: UIButton) {
        individualCheckButton.isSelected = !individualCheckButton.isSelected
        canSignup()
    }
    @IBAction func adCheckButtonDidTap(_ sender: UIButton) {
        adCheckButton.isSelected = !adCheckButton.isSelected
    }

    
}

extension SignupViewController: UITextFieldDelegate {    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        nickName = nickNameTextField.text!
        canSignup()
    }
    
    
}

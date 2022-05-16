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

    @IBOutlet var nickNameLabel: UILabel!
    @IBOutlet var agreeLabel: UILabel!
    
    @IBOutlet var profileImageView: UIImageView!
    @IBOutlet var nickNameTextField: UITextField!
    
    @IBOutlet var allCheckButton: UIButton!
    @IBOutlet var ageCheckButton: UIButton!
    @IBOutlet var termsCheckButton: UIButton!
    @IBOutlet var individualCheckButton: UIButton!
    
    @IBOutlet var allButton: UIButton!
    @IBOutlet var ageButton: UIButton!
    @IBOutlet var termsButton: UIButton!
    @IBOutlet var individualButton: UIButton!
    
    @IBOutlet var signupButton: UIButton!
    
    lazy var dataManager = LoginDataManager()
    
    var checkButtonList: [UIButton] = []
    var buttonList: [UIButton] = []
    
    var loginAuthType = ""
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
        nickNameTextField.layer.cornerRadius = 8
        
        checkButtonList.append(ageCheckButton)
        checkButtonList.append(termsCheckButton)
        checkButtonList.append(individualCheckButton)
        
        buttonList.append(ageButton)
        buttonList.append(termsButton)
        buttonList.append(signupButton)
        buttonList.append(individualButton)
        
        
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
        
        let signupInput: SignUpInput = SignUpInput(authType: loginAuthType, nickName: nickName, token: signupToken)
        
        print(signupInput)
        dataManager.postSignuUp(parameters: signupInput, viewController: self)
        
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

    
}

extension SignupViewController: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        nickName = nickNameTextField.text!
        canSignup()
    }
    
    
}

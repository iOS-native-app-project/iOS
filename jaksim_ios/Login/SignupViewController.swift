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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layoutSetup()

    }
    
    func layoutSetup () {
        
        nickNameTextField.backgroundColor = .systemGray6
        
        checkButtonList.append(ageCheckButton)
        checkButtonList.append(termsCheckButton)
        checkButtonList.append(individualCheckButton)
        checkButtonList.append(adCheckButton)
        

    }

    @IBAction func signupButtonDidTap(_ sender: UIButton) {
        signupButton.isSelected = !signupButton.isSelected
    }
    @IBAction func allCheckButtonDidTap(_ sender: UIButton) {
        allCheckButton.isSelected = !allCheckButton.isSelected
        
        for button in checkButtonList {
            button.isSelected = allCheckButton.isSelected
        }
    
    }
    @IBAction func ageCheckButtonDidTap(_ sender: UIButton) {
        ageCheckButton.isSelected = !ageCheckButton.isSelected
    }
    @IBAction func termsCheckButtonDidTap(_ sender: UIButton) {
        termsCheckButton.isSelected = !termsCheckButton.isSelected
    }
    @IBAction func individualCheckButtonDidTap(_ sender: UIButton) {
        individualCheckButton.isSelected = !individualCheckButton.isSelected
    }
    @IBAction func adCheckButtonDidTap(_ sender: UIButton) {
        adCheckButton.isSelected = !adCheckButton.isSelected
    }
    
}

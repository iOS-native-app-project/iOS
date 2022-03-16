//
//  SignupViewController.swift
//  jaksim_ios
//
//  Created by 소영 on 2022/03/16.
//

import UIKit

class SignupViewController: UIViewController {

    @IBOutlet var profileImageView: UIImageView!
    @IBOutlet var nickNameTextField: UITextField!
    
    @IBOutlet var signupButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layoutSetup()

    }
    
    func layoutSetup () {
        
        nickNameTextField.backgroundColor = .green
        
        
    

    }

    @IBAction func signupButtonDidTap(_ sender: UIButton) {
    }
    
}

//
//  PasswordViewController.swift
//  jaksim_ios
//
//  Created by Apple on 2022/05/18.
//

import UIKit
import RxSwift
import RxCocoa

class PasswordViewController: UIViewController {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var firstTitleLabel: UILabel!
    @IBOutlet weak var secondTitleLabel: UILabel!
    @IBOutlet weak var passwordContainerView: UIView!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var okButton: UIButton!
    
    var meetingId = ""
    
    let passwordViewModel = PasswordViewModel()
    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //MARK:- 뷰모델에 meeting id 전달하기
        passwordViewModel.updateMeetingId(meetingId: meetingId)
        
        //MARK:- 컨테이너뷰
        containerView.layer.cornerRadius = 12
        
        //MARK:- '비밀번호 입력' 라벨
        
        //MARK:- '비밀번호를 입력해주세요.' 라벨
        
        //MARK:- 비밀번호 입력
        passwordTextField.delegate = self
        
        passwordContainerView.layer.cornerRadius = 8
        passwordContainerView.backgroundColor = K.Color.Gray238
        
        passwordViewModel.passwordSubject
            .subscribe(onNext: { passwordResponse in
                if passwordResponse.isOk {
                    print("비밀번호 입력 성공")
                }
            },
            onError: { error in
                print("비밀번호 입력 에러")
                print(error)
            })
            .disposed(by: disposeBag)
    }

    @IBAction func cancelButtonDidTap(_ sender: UIButton) {
        removeCoverView()
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func okButtonDidTap(_ sender: UIButton) {
        passwordViewModel.checkPassword(password: passwordTextField.text ?? "")
    }
    
    //MARK:- 어두운 배경을 다시 원래대로 돌려놓기
    func removeCoverView() {
        let meetingEntranceVC = self.presentingViewController as! MeetingEntranceViewController
        UIView.transition(with: meetingEntranceVC.coverView!, duration: 0.5, options: .transitionCrossDissolve, animations: {
            meetingEntranceVC.coverView?.backgroundColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0)
        }, completion: { _ in
            meetingEntranceVC.coverView!.removeFromSuperview()
        })
        
    }
}

//MARK:- UITextFieldDelegate
extension PasswordViewController: UITextFieldDelegate {
    //MARK:- '비밀 번호'칸에 숫자만 입력 가능하게 만들기
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == self.passwordTextField {
            let allowedCharacters = CharacterSet.decimalDigits
            let characterSet = CharacterSet(charactersIn: string)
            return allowedCharacters.isSuperset(of: characterSet)
        }
        else { return true }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == self.passwordTextField {
            if textField.text == "" {
                okButton.isEnabled = false
            }
            else {
                guard let passwordText = textField.text else { return }
                if (4...6).contains(passwordText.count) {
                    okButton.isEnabled = true
                }
                else {
                    okButton.isEnabled = false
                }
            }
        }
    }
}

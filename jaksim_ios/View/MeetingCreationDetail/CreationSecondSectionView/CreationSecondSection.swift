//
//  CreationSecondSection.swift
//  jaksim_ios
//
//  Created by Apple on 2022/04/05.
//

import UIKit

class CreationSecondSection: UIView {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var firstContainerView: UIView!
    @IBOutlet weak var firstContainerTitleLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var upButton: UIButton!
    @IBOutlet weak var downButton: UIButton!
    
    @IBOutlet weak var secondContainerView: UIView!
    @IBOutlet weak var secondContainerTitleLabel: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordButton: UIButton!
    @IBOutlet weak var noneLabel: UILabel!
    
    var numberOfPeople = 3
    var passwordFlag = true
    var passwordBoundFlag = false
    
    var delegate: CreationSectionDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadView()
        
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadView()
    }
    private func loadView(){
        let view = Bundle.main.loadNibNamed(K.MeetingCreation.Name.CreationSecondSectionXibName, owner: self, options: nil)?.first as! UIView
        view.frame = self.bounds
        
        //MARK:- '인원수와 비밀번호를 설정해주세요.' 라벨
        titleLabel.text = K.MeetingCreation.Text.CreationSecondSection.Title
        titleLabel.font = UIFont(name: K.FontName.PretendardSemiBold, size: 14)
        titleLabel.textColor = K.Color.Black66
        
        //MARK:- 인원수 지정
        firstContainerView.layer.borderWidth = 1
        firstContainerView.layer.borderColor = K.Color.Gray224.cgColor
        firstContainerView.layer.cornerRadius = 8
        firstContainerView.backgroundColor = .white
        
        firstContainerTitleLabel.font = UIFont(name: K.FontName.PretendardRegular, size: 14)
        firstContainerTitleLabel.textColor = K.Color.Black66
        
        numberLabel.font = UIFont(name: K.FontName.PretendardSemiBold, size: 14)
        numberLabel.textColor = K.Color.Black66
        numberLabel.text = "\(numberOfPeople)명"
        
        //MARK:- 비밀번호 지정
        secondContainerView.layer.borderWidth = 1
        secondContainerView.layer.borderColor = K.Color.Gray224.cgColor
        secondContainerView.layer.cornerRadius = 8
        secondContainerView.backgroundColor = .white
        
        secondContainerTitleLabel.font = UIFont(name: K.FontName.PretendardRegular, size: 14)
        secondContainerTitleLabel.textColor = K.Color.Black66
        
        passwordTextField.font = UIFont(name: K.FontName.PretendardRegular, size: 14)
        passwordTextField.textColor = K.Color.Gray189
        passwordTextField.setPadding(left: 0, right: 0)
        passwordTextField.font = UIFont(name: K.FontName.PretendardRegular, size: 14)
        passwordTextField.textColor = K.Color.Black33
        passwordTextField.isUserInteractionEnabled = true
        passwordTextField.delegate = self
        
        noneLabel.font = UIFont(name: K.FontName.PretendardRegular, size: 14)
        noneLabel.textColor = K.Color.Black97
        
        passwordButton.setImage(K.Image.UncheckedIcon, for: .normal)
        passwordButton.tintColor = K.Color.Gray224
        
        
        self.addSubview(view)
    }

    //MARK:- 인원수 조정 버튼 클릭 시 액션
    @IBAction func upButtonDidTap(_ sender: UIButton) {
        if numberOfPeople != 10 {
            numberOfPeople += 1
            numberLabel.text = "\(numberOfPeople)명"
        }
    }
    @IBAction func downButtonDidTap(_ sender: Any) {
        if numberOfPeople != 1 {
            numberOfPeople -= 1
            numberLabel.text = "\(numberOfPeople)명"
        }
    }
    
    //MARK:- 비밀번호 버튼 클릭시 액션
    @IBAction func passwordButtonDidTap(_ sender: UIButton) {
        if passwordFlag {
            passwordFlag = false
            passwordButton.setImage(K.Image.CheckedIcon, for: .normal)
            passwordButton.tintColor = K.Color.MainPuple
            passwordTextField.text = ""
            passwordTextField.isUserInteractionEnabled = false
            delegate?.checkData()
        }
        else {
            passwordFlag = true
            passwordButton.setImage(K.Image.UncheckedIcon, for: .normal)
            passwordButton.tintColor = K.Color.Gray224
            passwordTextField.isUserInteractionEnabled = true
            delegate?.checkData()
        }
    }
}

//MARK:- UITextFieldDelegate
extension CreationSecondSection: UITextFieldDelegate {
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
                passwordBoundFlag = false
                delegate?.checkData()
            }
            else {
                guard let passwordText = textField.text else { return }
                if (4...6).contains(passwordText.count) {
                    passwordBoundFlag = true
                    delegate?.checkData()
                }
                else {
                    passwordBoundFlag = false
                    delegate?.checkData()
                }
            }
        }
    }
}


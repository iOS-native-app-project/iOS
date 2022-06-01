//
//  CreationFourthSection.swift
//  jaksim_ios
//
//  Created by Apple on 2022/04/05.
//

import UIKit
import DropDown

class CreationFourthSection: UIView {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var firstSubtitleLabel: UILabel!
    @IBOutlet weak var countButton: UIButton!
    @IBOutlet weak var distanceButton: UIButton!
    @IBOutlet weak var timeButton: UIButton!
    
    @IBOutlet weak var secondSubtitleLabel: UILabel!
    @IBOutlet weak var detailFigureTextField: UITextField!
    
    @IBOutlet weak var unitDropDownView: UIView!
    @IBOutlet weak var unitDropDownButton: UIButton!
    @IBOutlet weak var unitLabel: UILabel!
    @IBOutlet weak var updownImageView: UIImageView!
    
    private let dropDown = DropDown()
    
    private let countUnitList = ["회"]
    private let timeUnitList = ["분", "시간"]
    private let distanceUnitList = ["m", "km"]
    
    var detailFigureFlag = false
    var detailFigure = 0
    var unit = "회"
    
    var delegate: CreationSectionDelegate?
    
    lazy private var buttonList: [UIButton] = [countButton, distanceButton, timeButton]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadView()
        
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadView()
    }
    private func loadView(){
        let view = Bundle.main.loadNibNamed(Constant.MeetingCreation.Name.CreationFourthSectionXibName, owner: self, options: nil)?.first as! UIView
        view.frame = self.bounds
        
        //MARK:- '목표치를 입력해주세요.' 라벨
        titleLabel.text = Constant.MeetingCreation.Text.CreationFourthSection.Title
        //titleLabel.font = UIFont(name: Constant.FontName.PretendardSemiBold, size: 14)
        titleLabel.textColor = Constant.Color.Black66
        
        //MARK:- '단위' 라벨
        //firstSubtitleLabel.font = UIFont(name: Constant.FontName.PretendardSemiBold, size: 14)
        firstSubtitleLabel.textColor = Constant.Color.Black97
        
        //MARK:- 단위 버튼(횟수, 거리, 시간)
       // countButton.titleLabel?.font = UIFont(name: Constant.FontName.PretendardRegular, size: 14)
        countButton.setTitleColor(Constant.Color.MainPuple, for: .normal)
        countButton.layer.borderWidth = 1
        countButton.layer.borderColor = Constant.Color.MainPuple.cgColor
        countButton.layer.cornerRadius = 8
        countButton.backgroundColor = UIColor(red: 238.0/255.0, green: 241.0/255.0, blue: 255.0/255.0, alpha: 1.0)
        
        //distanceButton.titleLabel?.font = UIFont(name: Constant.FontName.PretendardRegular, size: 14)
        distanceButton.setTitleColor(Constant.Color.Black66, for: .normal)
        distanceButton.layer.borderWidth = 1
        distanceButton.layer.borderColor = Constant.Color.Gray224.cgColor
        distanceButton.layer.cornerRadius = 8
        
        //timeButton.titleLabel?.font = UIFont(name: Constant.FontName.PretendardRegular, size: 14)
        timeButton.setTitleColor(Constant.Color.Black66, for: .normal)
        timeButton.layer.borderWidth = 1
        timeButton.layer.borderColor = Constant.Color.Gray224.cgColor
        timeButton.layer.cornerRadius = 8
        
        //MARK:- '상세 수치' 라벨
        //secondSubtitleLabel.font = UIFont(name: Constant.FontName.PretendardSemiBold, size: 14)
        secondSubtitleLabel.textColor = Constant.Color.Black97
        
        //MARK:- 수치 입력 텍스트 필드
        detailFigureTextField.layer.borderWidth = 1
        detailFigureTextField.layer.borderColor = Constant.Color.Gray224.cgColor
        detailFigureTextField.layer.cornerRadius = 8
        detailFigureTextField.setPadding(left: 20, right: 0)
        detailFigureTextField.delegate = self
        
        //MARK:- 단위 선택 박스
        
        unitDropDownView.layer.cornerRadius = 8
        unitDropDownView.layer.borderWidth = 1
        unitDropDownView.layer.borderColor = Constant.Color.Gray224.cgColor
        
        //DropDown.appearance().textFont = UIFont(name: Constant.FontName.PretendardRegular, size: 14)!
        DropDown.appearance().textColor = Constant.Color.Black33
        DropDown.appearance().backgroundColor = .white
        DropDown.appearance().selectionBackgroundColor = Constant.Color.Gray245
        DropDown.appearance().setupCornerRadius(8)
        
        updownImageView.image = Constant.Image.DownIcon
        updownImageView.image!.withRenderingMode(.alwaysTemplate)
        updownImageView.tintColor = Constant.Color.Black33
        
       // unitLabel.font = UIFont(name: Constant.FontName.PretendardRegular, size: 14)
        unitLabel.textColor = Constant.Color.Black33
        
        dropDown.dismissMode = .automatic
        dropDown.anchorView = self.unitDropDownView
        dropDown.bottomOffset = CGPoint(x: 0, y: unitDropDownView.bounds.height)
        
        dropDown.selectionAction = { [weak self] (index, item) in
            self!.unitLabel.text = item
            self!.updownImageView.image = Constant.Image.DownIcon
            self!.unit = item
        }
        
        dropDown.cancelAction = { [weak self] in
            self!.updownImageView.image = Constant.Image.DownIcon
        }
        setDropBox(countUnitList)
        
        self.addSubview(view)
    }
    
    //MARK:- 단위 선택 박스 단위 세팅
    func setDropBox(_ unitList: [String]){
        dropDown.dataSource = unitList
        unitLabel.text = unitList[0]
        unit = unitList[0]
        dropDown.selectRow(at: 0)
    }
    
    //MARK:- 단위 선택 박스 클릭 시 액션
    @IBAction func unitDropBoxDidTap(_ sender: UIButton) {
        dropDown.show()
        updownImageView.image = Constant.Image.UpIcon
    }
    
    //MARK:- 주기 버튼 클릭 시 액션
    @IBAction func countButtonDidTap(_ sender: UIButton) {
        setButtonColor(sender)
        setDropBox(countUnitList)
    }
    @IBAction func distanceDidTap(_ sender: UIButton) {
        setButtonColor(sender)
        setDropBox(distanceUnitList)
    }
    @IBAction func timeButtonDidTap(_ sender: UIButton) {
        setButtonColor(sender)
        setDropBox(timeUnitList)
    }
    
    func setButtonColor (_ sender: UIButton) {
        for button in buttonList {
            if sender == button {
                button.setTitleColor(Constant.Color.MainPuple, for: .normal)
                button.layer.borderColor = Constant.Color.MainPuple.cgColor
                button.backgroundColor = UIColor(red: 238.0/255.0, green: 241.0/255.0, blue: 255.0/255.0, alpha: 1.0)
            }
            else {
                button.setTitleColor(Constant.Color.Black66, for: .normal)
                button.layer.borderColor = Constant.Color.Gray224.cgColor
                button.backgroundColor = .white
            }
        }
    }
}

//MARK:- 텍스트 필드 패딩 함수
extension UITextField {
    
    func setPadding(left: CGFloat? = nil, right: CGFloat? = nil){
        
        if let left = left {
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: left, height: self.frame.size.height))
            self.leftView = paddingView
            self.leftViewMode = .always
        }
        if let right = right {
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: right, height: self.frame.size.height))
            self.rightView = paddingView
            self.rightViewMode = .always
        }
    }
}

//MARK:- UITextFieldDelegate
extension CreationFourthSection: UITextFieldDelegate {
    //MARK:- '상세 수치'칸에 숫자만 입력 가능하게 만들기
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == self.detailFigureTextField {
            let allowedCharacters = CharacterSet.decimalDigits
            let characterSet = CharacterSet(charactersIn: string)
            return allowedCharacters.isSuperset(of: characterSet)
        }
        else { return true }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == self.detailFigureTextField {
            if textField.text == "" {
                detailFigureFlag = false
                delegate?.checkData()
            }
            else {
                guard let textFiledText = textField.text else { return }
                detailFigure = Int(textFiledText) ?? 0
                detailFigureFlag = true
                delegate?.checkData()
            }
        }
    }
}

//
//  CreationThirdSection.swift
//  jaksim_ios
//
//  Created by Apple on 2022/04/05.
//

import UIKit

class CreationThirdSection: UIView {

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var dayButton: UIButton!
    @IBOutlet weak var weekButton: UIButton!
    @IBOutlet weak var monthButton: UIButton!
    
    lazy private var buttonList: [UIButton] = [dayButton, weekButton, monthButton]
    var period = "하루"
    
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
        let view = Bundle.main.loadNibNamed(K.MeetingCreation.Name.CreationThirdSectionXibName, owner: self, options: nil)?.first as! UIView
        view.frame = self.bounds
        
        //MARK:- '주기를 선택해주세요.' 라벨
        titleLabel.text = K.MeetingCreation.Text.CreationThirdSection.Title
        titleLabel.font = UIFont(name: K.FontName.PretendardSemiBold, size: 14)
        titleLabel.textColor = K.Color.Black66
        
        //MARK:- 주기 버튼(하루, 일주일, 한달)
        dayButton.titleLabel?.font = UIFont(name: K.FontName.PretendardRegular, size: 14)
        dayButton.setTitleColor(K.Color.MainPuple, for: .normal)
        dayButton.layer.borderWidth = 1
        dayButton.layer.borderColor = K.Color.MainPuple.cgColor
        dayButton.layer.cornerRadius = 8
        dayButton.backgroundColor = UIColor(red: 238.0/255.0, green: 241.0/255.0, blue: 255.0/255.0, alpha: 1.0)
        
        weekButton.titleLabel?.font = UIFont(name: K.FontName.PretendardRegular, size: 14)
        weekButton.setTitleColor(K.Color.Black66, for: .normal)
        weekButton.layer.borderWidth = 1
        weekButton.layer.borderColor = K.Color.Gray224.cgColor
        weekButton.layer.cornerRadius = 8
        
        monthButton.titleLabel?.font = UIFont(name: K.FontName.PretendardRegular, size: 14)
        monthButton.setTitleColor(K.Color.Black66, for: .normal)
        monthButton.layer.borderWidth = 1
        monthButton.layer.borderColor = K.Color.Gray224.cgColor
        monthButton.layer.cornerRadius = 8
        
        self.addSubview(view)
    }
    
    //MARK:- 주기 버튼 클릭 시 액션
    @IBAction func dayButtonDidTap(_ sender: UIButton) {
        setButtonColor(sender)
        period = "하루"
        delegate?.checkData()
        
    }
    @IBAction func weekButtonDidTap(_ sender: UIButton) {
        setButtonColor(sender)
        period = "일주일"
        delegate?.checkData()
        
    }
    @IBAction func monthButtonDidTap(_ sender: UIButton) {
        setButtonColor(sender)
        period = "한달"
        delegate?.checkData()
        
    }
    
    func setButtonColor (_ sender: UIButton) {
        for button in buttonList {
            if sender == button {
                button.setTitleColor(K.Color.MainPuple, for: .normal)
                button.layer.borderColor = K.Color.MainPuple.cgColor
                button.backgroundColor = UIColor(red: 238.0/255.0, green: 241.0/255.0, blue: 255.0/255.0, alpha: 1.0)
            }
            else {
                button.setTitleColor(K.Color.Black66, for: .normal)
                button.layer.borderColor = K.Color.Gray224.cgColor
                button.backgroundColor = .white
            }
        }
    }
}

//
//  MeetingCreationDetailViewController.swift
//  jaksim_ios
//
//  Created by Apple on 2022/04/05.
//

import UIKit

class MeetingCreationDetailViewController: UIViewController {
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var navigationTitleLabel: UILabel!
    @IBOutlet weak var stackView: UIStackView!
    
    @IBOutlet weak var creationFirstSection: CreationFirstSection!
    @IBOutlet weak var creationSecondSection: CreationSecondSection!
    @IBOutlet weak var creationThirdSection: CreationThirdSection!
    @IBOutlet weak var creationFourthSection: CreationFourthSection!
    
    @IBOutlet weak var creationButton: UIButton!
    @IBOutlet weak var firstResultLabel: UILabel!
    @IBOutlet weak var secondResultLabel: UILabel!
    
    var category: String = "달리기"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        creationFirstSection.delegate = self
        creationSecondSection.delegate = self
        creationThirdSection.delegate = self
        creationFourthSection.delegate = self
        
        //MARK: - 네비게이션바 타이틀 라벨
        navigationTitleLabel.text = "모임 개설 (2/2)"
        navigationTitleLabel.font = UIFont(name: Constant.FontName.PretendardSemiBold, size: 18)
        navigationTitleLabel.textColor = Constant.Color.Black33
        
        //MARK: - 뒤로가기 버튼
        backButton.setImage(Constant.Image.BackIcon, for: .normal)
        backButton.tintColor = Constant.Color.Black33
        
        //MARK: - 닫기 버튼
        closeButton.setImage(Constant.Image.CloseIcon, for: .normal)
        closeButton.tintColor = Constant.Color.Black33
        
        //MARK: - 개설하기 버튼
        creationButton.layer.cornerRadius = 24
        creationButton.backgroundColor = Constant.Color.Gray224
        creationButton.setTitleColor(.white, for: .normal)
        creationButton.titleLabel?.font = UIFont(name: Constant.FontName.PretendardSemiBold, size: 16)
        creationButton.isUserInteractionEnabled = false
        
        //MARK: - 결과 라벨
        firstResultLabel.font = UIFont(name: Constant.FontName.PretendardSemiBold, size: 16)
        firstResultLabel.textColor = Constant.Color.Black97
        
        secondResultLabel.font = UIFont(name: Constant.FontName.PretendardSemiBold, size: 16)
        secondResultLabel.textColor = Constant.Color.Black97
        
        checkData()
    }
    
    //MARK: - 뒤로가기 버튼 action
    @IBAction func backButtonDidTap(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    //MARK: - 개설하기 버튼 action
    @IBAction func creationButtonDidTap(_ sender: UIButton) {
        let meetingViewModel = MeetingCreationViewModel(
            name: creationFirstSection.firstTextView.text,
            image: "",
            categoryId: 1,
            descript: creationFirstSection.secondTextView.text,
            limit: creationSecondSection.numberOfPeople,
            password: creationSecondSection.passwordTextField.text ?? "",
            cycle: 1,
            unit: creationFourthSection.unit,
            targetAmount: creationFourthSection.detailFigure)
        
        meetingViewModel.createMeeting()
    }
    @IBAction func closeButtonDidTap(_ sender: UIButton) {
        guard let viewControllerStack = self.navigationController?.viewControllers else { return }
        
        for viewController in viewControllerStack {
            if let tabBarCotroller = viewController as? UITabBarController {
                self.navigationController?.popToViewController(tabBarCotroller, animated: true)
            }
        }
    }
}

extension MeetingCreationDetailViewController: CreationSectionDelegate {
    //MARK: - 모임 정보 체크
    func checkData () {
        print("***")
        print("creationSecondSection.passwordFlag:\(creationSecondSection.passwordFlag)")
        print("creationSecondSection.passwordBoundFlag:\(creationSecondSection.passwordBoundFlag)")
        print("---")
        print("creationFirstSection.meetingNameFlag:\(creationFirstSection.meetingNameFlag)")
        print("creationFirstSection.meetingDescriptionFlag:\(creationFirstSection.meetingDescriptionFlag)")
        print("creationFourthSection.detailFigureFlag:\(creationFourthSection.detailFigureFlag)")
        print("***")
        if creationSecondSection.passwordFlag {
            if creationSecondSection.passwordBoundFlag {
                if creationFirstSection.meetingNameFlag
                    && creationFirstSection.meetingDescriptionFlag
                    && creationFourthSection.detailFigureFlag {
                    
                    firstResultLabel.text = "\(creationThirdSection.period)에 \(creationFourthSection.detailFigure)\(creationFourthSection.unit) \(self.category)을(를)"
                    secondResultLabel.text = "모임의 목표로 등록하시겠습니까?"
                    
                    guard let text = self.firstResultLabel.text else { return }
                    let attributeString = NSMutableAttributedString(string: text)
                    
                    attributeString.addAttribute(.foregroundColor, value: Constant.Color.MainPuple, range: (text as NSString).range(of: creationThirdSection.period))
                    attributeString.addAttribute(.foregroundColor, value: Constant.Color.MainPuple, range: (text as NSString).range(of: String(creationFourthSection.detailFigure)))
                    attributeString.addAttribute(.foregroundColor, value: Constant.Color.MainPuple, range: (text as NSString).range(of: creationFourthSection.unit))
                    attributeString.addAttribute(.foregroundColor, value: Constant.Color.MainPuple, range: (text as NSString).range(of: self.category))
                    
                    self.firstResultLabel.attributedText = attributeString
                    
                    creationButton.backgroundColor = Constant.Color.MainPuple
                    creationButton.isUserInteractionEnabled = true
                    
                }
                else {
                    firstResultLabel.text = ""
                    secondResultLabel.text = ""
                    
                    creationButton.backgroundColor = Constant.Color.Gray224
                    creationButton.isUserInteractionEnabled = false
                }
            }
            else {
                firstResultLabel.text = ""
                secondResultLabel.text = ""
                
                creationButton.backgroundColor = Constant.Color.Gray224
                creationButton.isUserInteractionEnabled = false
            }
        }
        else {
            if creationFirstSection.meetingNameFlag
                && creationFirstSection.meetingDescriptionFlag
                && creationFourthSection.detailFigureFlag{
                firstResultLabel.text = "\(creationThirdSection.period)에 \(creationFourthSection.detailFigure)\(creationFourthSection.unit) \(self.category)을(를)"
                secondResultLabel.text = "모임의 목표로 등록하시겠습니까?"
                
                guard let text = self.firstResultLabel.text else { return }
                let attributeString = NSMutableAttributedString(string: text)
                
                attributeString.addAttribute(.foregroundColor, value: Constant.Color.MainPuple, range: (text as NSString).range(of: creationThirdSection.period))
                attributeString.addAttribute(.foregroundColor, value: Constant.Color.MainPuple, range: (text as NSString).range(of: String(creationFourthSection.detailFigure)))
                attributeString.addAttribute(.foregroundColor, value: Constant.Color.MainPuple, range: (text as NSString).range(of: self.category))
                
                self.firstResultLabel.attributedText = attributeString
                
                creationButton.backgroundColor = Constant.Color.MainPuple
                creationButton.isUserInteractionEnabled = true
            }
            else {
                firstResultLabel.text = ""
                secondResultLabel.text = ""
                
                creationButton.backgroundColor = Constant.Color.Gray224
                creationButton.isUserInteractionEnabled = false
            }
        }
        
    }
}

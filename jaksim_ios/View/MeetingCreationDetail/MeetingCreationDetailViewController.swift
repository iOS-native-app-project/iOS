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
    @IBOutlet weak var creationButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK:- 네비게이션바 타이틀 라벨
        navigationTitleLabel.text = "모임 개설 (2/2)"
        navigationTitleLabel.font = UIFont(name: K.FontName.PretendardSemiBold, size: 18)
        navigationTitleLabel.textColor = K.Color.Black33
        
        //MARK:- 뒤로가기 버튼
        backButton.setImage(K.Image.BackIcon, for: .normal)
        backButton.tintColor = K.Color.Black33
        
        //MARK:- 닫기 버튼
        closeButton.setImage(K.Image.CloseIcon, for: .normal)
        closeButton.tintColor = K.Color.Black33
        
        //MARK:- 개설하기 버튼
        creationButton.layer.cornerRadius = 24
        creationButton.backgroundColor = K.Color.Gray224
        creationButton.setTitleColor(.white, for: .normal)
        creationButton.titleLabel?.font = UIFont(name: K.FontName.PretendardSemiBold, size: 16)
    }
    
    //MARK:- 뒤로가기 버튼 action
    @IBAction func backButtonDidTap(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}

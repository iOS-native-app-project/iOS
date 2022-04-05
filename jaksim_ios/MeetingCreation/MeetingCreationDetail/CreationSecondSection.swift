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
    @IBOutlet weak var checkboxImageView: UIImageView!
    @IBOutlet weak var noneLabel: UILabel!
    
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
        
        titleLabel.text = K.MeetingCreation.Text.CreationSecondSection.Title
        titleLabel.font = UIFont(name: K.FontName.PretendardSemiBold, size: 14)
        titleLabel.textColor = K.Color.Black66
        
        firstContainerView.layer.borderWidth = 1
        firstContainerView.layer.borderColor = K.Color.Gray224.cgColor
        firstContainerView.layer.cornerRadius = 8
        firstContainerView.backgroundColor = .white
        
        firstContainerTitleLabel.font = UIFont(name: K.FontName.PretendardRegular, size: 14)
        firstContainerTitleLabel.textColor = K.Color.Black66
        
        numberLabel.font = UIFont(name: K.FontName.PretendardSemiBold, size: 14)
        numberLabel.textColor = K.Color.Black66
        
        secondContainerView.layer.borderWidth = 1
        secondContainerView.layer.borderColor = K.Color.Gray224.cgColor
        secondContainerView.layer.cornerRadius = 8
        secondContainerView.backgroundColor = .white
        
        secondContainerTitleLabel.font = UIFont(name: K.FontName.PretendardRegular, size: 14)
        secondContainerTitleLabel.textColor = K.Color.Black66
        
        passwordTextField.font = UIFont(name: K.FontName.PretendardRegular, size: 14)
        passwordTextField.textColor = K.Color.Gray189
        
        noneLabel.font = UIFont(name: K.FontName.PretendardRegular, size: 14)
        noneLabel.textColor = K.Color.Black97
        
        self.addSubview(view)
    }

}

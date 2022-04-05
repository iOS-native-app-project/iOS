//
//  CreationFourthSection.swift
//  jaksim_ios
//
//  Created by Apple on 2022/04/05.
//

import UIKit

class CreationFourthSection: UIView {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var firstSubtitleLabel: UILabel!
    @IBOutlet weak var countButton: UIButton!
    @IBOutlet weak var distanceButton: UIButton!
    @IBOutlet weak var timeButton: UIButton!
    @IBOutlet weak var secondSubtitleLabel: UILabel!
    @IBOutlet weak var numberInsertTextField: UITextField!
    @IBOutlet weak var unitSelectionButton: UIButton!
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadView()
        
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadView()
    }
    private func loadView(){
        let view = Bundle.main.loadNibNamed(K.MeetingCreation.Name.CreationFourthSectionXibName, owner: self, options: nil)?.first as! UIView
        view.frame = self.bounds
        
        titleLabel.text = K.MeetingCreation.Text.CreationFourthSection.Title
        titleLabel.font = UIFont(name: K.FontName.PretendardSemiBold, size: 14)
        titleLabel.textColor = K.Color.Black66
        
        firstSubtitleLabel.font = UIFont(name: K.FontName.PretendardSemiBold, size: 14)
        firstSubtitleLabel.textColor = K.Color.Black97
        
        countButton.titleLabel?.font = UIFont(name: K.FontName.PretendardRegular, size: 14)
        countButton.setTitleColor(K.Color.Black66, for: .normal)
        countButton.layer.borderWidth = 1
        countButton.layer.borderColor = K.Color.Gray224.cgColor
        countButton.layer.cornerRadius = 8
        
        distanceButton.titleLabel?.font = UIFont(name: K.FontName.PretendardRegular, size: 14)
        distanceButton.setTitleColor(K.Color.Black66, for: .normal)
        distanceButton.layer.borderWidth = 1
        distanceButton.layer.borderColor = K.Color.Gray224.cgColor
        distanceButton.layer.cornerRadius = 8
        
        timeButton.titleLabel?.font = UIFont(name: K.FontName.PretendardRegular, size: 14)
        timeButton.setTitleColor(K.Color.Black66, for: .normal)
        timeButton.layer.borderWidth = 1
        timeButton.layer.borderColor = K.Color.Gray224.cgColor
        timeButton.layer.cornerRadius = 8
        
        secondSubtitleLabel.font = UIFont(name: K.FontName.PretendardSemiBold, size: 14)
        secondSubtitleLabel.textColor = K.Color.Black97
        
        numberInsertTextField.layer.borderWidth = 1
        numberInsertTextField.layer.borderColor = K.Color.Gray224.cgColor
        numberInsertTextField.layer.cornerRadius = 8
        numberInsertTextField.setPadding(left: 20, right: 0)
        
        unitSelectionButton.titleLabel?.font = UIFont(name: K.FontName.PretendardRegular, size: 14)
        unitSelectionButton.setTitleColor(K.Color.Black33, for: .normal)
        unitSelectionButton.layer.borderWidth = 1
        unitSelectionButton.layer.borderColor = K.Color.Gray224.cgColor
        unitSelectionButton.layer.cornerRadius = 8
        unitSelectionButton.titleEdgeInsets.left = 20
        
        self.addSubview(view)
    }


}

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
        
        titleLabel.text = K.MeetingCreation.Text.CreationThirdSection.Title
        titleLabel.font = UIFont(name: K.FontName.PretendardSemiBold, size: 14)
        titleLabel.textColor = K.Color.Black66
        
        dayButton.titleLabel?.font = UIFont(name: K.FontName.PretendardRegular, size: 14)
        dayButton.setTitleColor(K.Color.Black66, for: .normal)
        dayButton.layer.borderWidth = 1
        dayButton.layer.borderColor = K.Color.Gray224.cgColor
        dayButton.layer.cornerRadius = 8
        
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

}

//
//  MeetingListTableViewCell.swift
//  jaksim_ios
//
//  Created by Apple on 2022/04/12.
//

import UIKit

class MeetingListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var categoryImageView: UIImageView!
    @IBOutlet weak var meetingNameLabel: UILabel!
    @IBOutlet weak var lockImageView: UIImageView!
    @IBOutlet weak var personImageView: UIImageView!
    @IBOutlet weak var numberOfPeopleLabel: UILabel!
    @IBOutlet weak var entranceButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        meetingNameLabel.font = UIFont(name: K.FontName.PretendardRegular, size: 14)
        meetingNameLabel.textColor = K.Color.Black66
        
        numberOfPeopleLabel.font = UIFont(name: K.FontName.PretendardRegular, size: 14)
        numberOfPeopleLabel.textColor = K.Color.Gray117
        
        personImageView.image = K.Image.personIcon
        personImageView.image = personImageView.image?.withRenderingMode(.alwaysTemplate)
        personImageView.tintColor = K.Color.Gray117
        
        categoryImageView.image = UIImage(named: "tmpImage.png")
        categoryImageView.layer.cornerRadius = 4
        
        entranceButton.backgroundColor = K.Color.Gray245
        entranceButton.layer.cornerRadius = entranceButton.bounds.height/2
        entranceButton.titleLabel?.font = UIFont(name: K.FontName.PretendardRegular, size: 14)
        entranceButton.setTitleColor(K.Color.MainPuple, for: .normal)
        
        lockImageView.image = K.Image.lockIcon
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}

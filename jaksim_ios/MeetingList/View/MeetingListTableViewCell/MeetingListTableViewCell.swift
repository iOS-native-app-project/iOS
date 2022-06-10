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
        
        meetingNameLabel.font = UIFont(name: Constant.FontName.PretendardRegular, size: 14)
        meetingNameLabel.textColor = Constant.Color.Black66
        
        numberOfPeopleLabel.font = UIFont(name: Constant.FontName.PretendardRegular, size: 14)
        numberOfPeopleLabel.textColor = Constant.Color.Gray117
        
        personImageView.image = Constant.Image.PersonIcon
        personImageView.image = personImageView.image?.withRenderingMode(.alwaysTemplate)
        personImageView.tintColor = Constant.Color.Gray117
        
        categoryImageView.layer.cornerRadius = 4
        
        entranceButton.backgroundColor = Constant.Color.Gray245
        entranceButton.layer.cornerRadius = entranceButton.bounds.height/2
        entranceButton.titleLabel?.font = UIFont(name: Constant.FontName.PretendardRegular, size: 14)
        entranceButton.setTitleColor(Constant.Color.MainPuple, for: .normal)
        
        lockImageView.image = Constant.Image.LockIcon
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}

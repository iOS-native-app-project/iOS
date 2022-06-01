//
//  NotificationListTableViewCell.swift
//  jaksim_ios
//
//  Created by Apple on 2022/04/27.
//

import UIKit

class NotificationListTableViewCell: UITableViewCell {

    @IBOutlet weak var notificationImageView: UIImageView!
    @IBOutlet weak var notificationContentLabel: UILabel!
    @IBOutlet weak var notificationDateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        notificationContentLabel.font = UIFont(name: K.FontName.PretendardSemiBold, size: 15)
        notificationContentLabel.textColor = K.Color.Black66
        
        notificationDateLabel.font = UIFont(name: K.FontName.PretendardRegular, size: 13)
        notificationDateLabel.textColor = K.Color.Gray158
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

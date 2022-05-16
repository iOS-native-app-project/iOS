//
//  MemberTableViewCell.swift
//  jaksim_ios
//
//  Created by 소영 on 2022/04/26.
//

import UIKit

class MemberTableViewCell: UITableViewCell {
    
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var percentLabel: UILabel!
    @IBOutlet weak var goodButton: UIButton!
    @IBOutlet weak var badButton: UIButton!
    
    var goToAlert: (()->())?
    var isGood: Bool?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func goodButtonAction(_ sender: UIButton) {
        isGood = true
        goToAlert?()
    }
    
    @IBAction func badButtonAction(_ sender: UIButton) {
        isGood = false
        goToAlert?()
    }
    

}

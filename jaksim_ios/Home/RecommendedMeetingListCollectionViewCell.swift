//
//  RecommendedMeetingListCollectionViewCell.swift
//  jaksim_ios
//
//  Created by Apple on 2022/03/15.
//

import UIKit

class RecommendedMeetingListCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var introduction: UILabel!
    @IBOutlet weak var hashTag: UILabel!
    
    @IBOutlet weak var personView: UIView!
    @IBOutlet weak var personImageView: UIImageView!
    @IBOutlet weak var personNumber: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        self.layer.borderColor = UIColor.blue.cgColor
//        self.layer.borderWidth = 1
        
        introduction.font = UIFont(name: K.Font.font_Pretendard_Regular, size: 15)
        introduction.textColor = UIColor(red: 66/255.0, green: 66/255.0, blue: 66/255.0, alpha: 1)
        hashTag.font = UIFont(name: K.Font.font_Pretendard_Regular, size: 13)
        hashTag.textColor = UIColor(red: 117/255.0, green: 117/255.0, blue: 117/255.0, alpha: 1)
        backgroundColor = .none
        
        imageView.layer.cornerRadius = 12
        
        personView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.7)
        personView.layer.cornerRadius = personView.frame.height/2
        
        personImageView.image = UIImage(named: K.Image.personIcon)
        
        personNumber.textColor = UIColor(red: 255/255.0, green: 255/255.0, blue: 255/255.0, alpha: 1)
        personNumber.font = UIFont(name: K.Font.font_Pretendard_Regular, size: 12)
    }

}

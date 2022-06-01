//
//  RecommendedMeetingListCollectionViewCell.swift
//  jaksim_ios
//
//  Created by Apple on 2022/03/15.
//

import UIKit

class RecommendedMeetingListCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var meetingImageView: UIImageView!
    @IBOutlet weak var meetingNameLabel: UILabel!
    @IBOutlet weak var descriptLabel: UILabel!
    
    @IBOutlet weak var personView: UIView!
    @IBOutlet weak var personImageView: UIImageView!
    @IBOutlet weak var numberOfPeopleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        backgroundColor = .none
        
        //MARK:- 모임 이름
        meetingNameLabel.font = UIFont(name: Constant.FontName.PretendardRegular, size: 15)
        meetingNameLabel.textColor = UIColor(red: 66/255.0, green: 66/255.0, blue: 66/255.0, alpha: 1)
        
        //MARK:- 한줄 소개
        descriptLabel.font = UIFont(name: Constant.FontName.PretendardRegular, size: 13)
        descriptLabel.textColor = UIColor(red: 117/255.0, green: 117/255.0, blue: 117/255.0, alpha: 1)
        
        //MARK:- 모임 이미지
        meetingImageView.layer.cornerRadius = 12
        
        //MARK:- 인원수
        personView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.7)
        personView.layer.cornerRadius = personView.frame.height/2
        
        personImageView.image = Constant.Image.PersonIcon
        personImageView.image = personImageView.image?.withRenderingMode(.alwaysTemplate)
        personImageView.tintColor = UIColor.white
        
        numberOfPeopleLabel.textColor = UIColor.white
        numberOfPeopleLabel.font = UIFont(name: Constant.FontName.PretendardRegular, size: 12)
    }

}

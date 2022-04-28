//
//  CollectionViewCell.swift
//  jaksim_ios
//
//  Created by Apple on 2022/03/02.
//

import UIKit

class MeetingListCollectionViewCell: UICollectionViewCell {

    
    @IBOutlet weak var bannerImageView: UIImageView!
    @IBOutlet weak var dDayLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var progressValueLabel: UILabel!
    @IBOutlet weak var numberOfpeopleLabel: UILabel!
    
    @IBOutlet weak var firstProgressBar: UIView!
    @IBOutlet weak var secondProgressBar: UIView!
    @IBOutlet weak var thirdProgressBar: UIView!
    @IBOutlet weak var fourthProgressBar: UIView!
    
    var progressBar = [UIView]()

    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 12
        
        //MARK:- 디데이
        dDayLabel.clipsToBounds = true
        dDayLabel.layer.cornerRadius = 2
        dDayLabel.backgroundColor = UIColor(red: (255/255.0), green: (255/255.0), blue: (255/255.0), alpha: 1.0)
        dDayLabel.textColor = UIColor(red: (85/255.0), green: (120/255.0), blue: (255/255.0), alpha: 1.0)
        dDayLabel.font = UIFont(name: K.FontName.PretendardSemiBold, size: 13)
        dDayLabel.textAlignment = .center
        
        //MARK:- 모임 이름
        nameLabel.textColor = UIColor(red: (255/255.0), green: (255/255.0), blue: (255/255.0), alpha: 1.0)
        nameLabel.font = UIFont(name: K.FontName.PretendardSemiBold, size: 18)
        
        //MARK:- 진행률
        progressLabel.textColor = UIColor(red: (255/255.0), green: (255/255.0), blue: (255/255.0), alpha: 1.0)
        progressLabel.font = UIFont(name: K.FontName.PretendardRegular, size: 12)
        
        //MARK:- 진행률 바
        progressBar.append(firstProgressBar)
        progressBar.append(secondProgressBar)
        progressBar.append(thirdProgressBar)
        progressBar.append(fourthProgressBar)
        
        for bar in progressBar{
            bar.layer.cornerRadius = bar.frame.height/2
            bar.backgroundColor = K.Color.Black33
        }
        firstProgressBar.backgroundColor = .white
        
        progressValueLabel.textColor = UIColor(red: (255/255.0), green: (255/255.0), blue: (255/255.0), alpha: 1.0)
        progressValueLabel.font = UIFont(name: K.FontName.PretendardExtraBold, size: 32)
        
        //MARK:- 인원수
        numberOfpeopleLabel.clipsToBounds = true
        numberOfpeopleLabel.layer.cornerRadius = numberOfpeopleLabel.frame.height/2
        numberOfpeopleLabel.backgroundColor = UIColor(red: (0/255.0), green: (0/255.0), blue: (0/255.0), alpha: 0.5)
        numberOfpeopleLabel.textColor = UIColor(red: (255/255.0), green: (255/255.0), blue: (255/255.0), alpha: 1.0)
        numberOfpeopleLabel.font = UIFont(name: K.FontName.PretendardSemiBold, size: 12)
        numberOfpeopleLabel.textAlignment = .center
    }

}

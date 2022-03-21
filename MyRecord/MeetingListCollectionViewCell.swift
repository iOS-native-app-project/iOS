//
//  CollectionViewCell.swift
//  jaksim_ios
//
//  Created by Apple on 2022/03/02.
//

import UIKit

class MeetingListCollectionViewCell: UICollectionViewCell {

    
    @IBOutlet weak var dDay: UILabel!
    @IBOutlet weak var goal: UILabel!
    @IBOutlet weak var progress: UILabel!
    @IBOutlet weak var progressValue: UILabel!
    @IBOutlet weak var meetingCount: UILabel!
    
    @IBOutlet weak var firstProgressBar: UIView!
    @IBOutlet weak var secondProgressBar: UIView!
    @IBOutlet weak var thirdProgressBar: UIView!
    @IBOutlet weak var fourthProgressBar: UIView!
    
    var progressBar = [UIView]()

    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 12
        
        // progressBar
        progressBar.append(firstProgressBar)
        progressBar.append(secondProgressBar)
        progressBar.append(thirdProgressBar)
        progressBar.append(fourthProgressBar)
        
        for bar in progressBar{
            bar.layer.cornerRadius = bar.frame.height/2
            bar.backgroundColor = UIColor(red: (255/255.0), green: (255/255.0), blue: (255/255.0), alpha: 1.0)
        }
        
        // dDay label
        dDay.clipsToBounds = true
        dDay.layer.cornerRadius = 2
        dDay.backgroundColor = UIColor(red: (255/255.0), green: (255/255.0), blue: (255/255.0), alpha: 1.0)
        dDay.textColor = UIColor(red: (85/255.0), green: (120/255.0), blue: (255/255.0), alpha: 1.0)
//        dDay.font = UIFont(name: K.Font.font_Pretendard_SemiBold, size: 13)
        dDay.textAlignment = .center
        
        // goal label
        goal.textColor = UIColor(red: (255/255.0), green: (255/255.0), blue: (255/255.0), alpha: 1.0)
//        goal.font = UIFont(name: K.Font.font_Pretendard_SemiBold, size: 18)
        
        // progress label
        progress.textColor = UIColor(red: (255/255.0), green: (255/255.0), blue: (255/255.0), alpha: 1.0)
//        progress.font = UIFont(name: K.Font.font_Pretendard_Regular, size: 12)
        
        progressValue.textColor = UIColor(red: (255/255.0), green: (255/255.0), blue: (255/255.0), alpha: 1.0)
//        progressValue.font = UIFont(name: K.Font.font_Pretendard_ExtraBold, size: 32)
        
        // meetingCount label
        meetingCount.clipsToBounds = true
        meetingCount.layer.cornerRadius = meetingCount.frame.height/2
        meetingCount.backgroundColor = UIColor(red: (0/255.0), green: (0/255.0), blue: (0/255.0), alpha: 0.5)
        meetingCount.textColor = UIColor(red: (255/255.0), green: (255/255.0), blue: (255/255.0), alpha: 1.0)
//        meetingCount.font = UIFont(name: K.Font.font_Pretendard_SemiBold, size: 12)
        meetingCount.textAlignment = .center
        
        
        
    }

}

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
        
        imageView.layer.cornerRadius = 12
        
        personView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.7)
        personView.layer.cornerRadius = personView.frame.height/2
    }

}

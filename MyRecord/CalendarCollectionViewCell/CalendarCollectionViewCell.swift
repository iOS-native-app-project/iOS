//
//  CalendarCollectionViewCell.swift
//  jaksim_ios
//
//  Created by Apple on 2022/05/05.
//

import UIKit

class CalendarCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var progressView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var actionButton: UIButton!
    
    var year: Int?
    var month: Int?
    var day: Int?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        progressView.layer.cornerRadius = progressView.bounds.height/2
        imageView.layer.cornerRadius = imageView.bounds.height/2
    }

}

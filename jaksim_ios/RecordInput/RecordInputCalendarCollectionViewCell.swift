//
//  RecordInputCalendarCollectionViewCell.swift
//  jaksim_ios
//
//  Created by 소영 on 2022/07/02.
//

import UIKit

class RecordInputCalendarCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var recordView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        recordView.layer.cornerRadius = recordView.frame.height/2
        dayLabel.textColor = .black
        backView.layer.cornerRadius = 999
        
    }

    override func prepareForReuse() {
        recordView.isHidden = true
        backView.isHidden = true
    }
    
    override var isSelected: Bool {
        didSet {
            if isSelected == true {
                backView.isHidden = false
                titleLabel.textColor = .white
            } else {
                backView.isHidden = true
                titleLabel.textColor = .black
            }
        }
    }
}

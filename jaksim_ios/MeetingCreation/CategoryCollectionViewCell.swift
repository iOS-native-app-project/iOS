//
//  CategoryCollectionViewCell.swift
//  jaksim_ios
//
//  Created by Apple on 2022/03/30.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        containerView.layer.cornerRadius = 12
        containerView.layer.backgroundColor = UIColor.gray.cgColor
    }

}

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
    
    override var isSelected: Bool {
        didSet{
            if isSelected {
                containerView.backgroundColor = UIColor(red: 238.0/255.0, green: 241.0/255.0, blue: 255.0/255.0, alpha: 1.0)
                containerView.layer.borderColor = Constant.Color.MainPuple.cgColor
            }
            else {
                containerView.backgroundColor = Constant.Color.Gray245
                containerView.layer.borderColor = Constant.Color.Gray245.cgColor
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        containerView.layer.cornerRadius = 12
        containerView.backgroundColor = Constant.Color.Gray245
        containerView.layer.borderWidth = 1
        containerView.layer.borderColor = Constant.Color.Gray245.cgColor
        
        label.font = UIFont(name: Constant.FontName.PretendardRegular, size: 14)
        label.textColor = Constant.Color.Black33
    }

}

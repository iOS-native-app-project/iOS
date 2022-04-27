//
//  CategoryListCollectionViewCell.swift
//  jaksim_ios
//
//  Created by Apple on 2022/03/15.
//

import UIKit

class CategoryListCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var categoryImageView: UIImageView!
    @IBOutlet weak var cateoryNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.backgroundColor = .none
        
        //MARK:- 카테고리
        containerView.backgroundColor = K.Color.Gray245
        containerView.layer.cornerRadius = 12
        
        cateoryNameLabel.font = UIFont(name: K.FontName.PretendardRegular, size: 13)
    }

}

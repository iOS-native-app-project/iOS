//
//  CategoryListCollectionViewCell.swift
//  jaksim_ios
//
//  Created by Apple on 2022/03/15.
//

import UIKit

class CategoryListCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var view: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var name: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.backgroundColor = .none
        
        view.backgroundColor = UIColor(red: 245/255.0, green: 245/255.0, blue: 245/255.0, alpha: 1)
        view.layer.cornerRadius = 12
        
        
        name.font = UIFont(name: K.Font.font_Pretendard_Regular, size: 13)
    }

}

//
//  SearchTermsCollectionViewCell.swift
//  jaksim_ios
//
//  Created by Apple on 2022/04/12.
//

import UIKit

class SearchTermsCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var searchTermButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.layer.borderWidth = 1
        self.layer.borderColor = K.Color.Gray224.cgColor
        self.layer.cornerRadius = self.bounds.height/2
        
        searchTermButton.layer.cornerRadius = searchTermButton.bounds.height/2
        searchTermButton.titleLabel?.font = UIFont(name: K.FontName.PretendardRegular, size: 14)
        searchTermButton.setTitleColor(K.Color.Black33, for: .normal)
    }

}

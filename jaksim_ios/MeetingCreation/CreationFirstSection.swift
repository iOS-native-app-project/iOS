//
//  MeetingFirstSection.swift
//  jaksim_ios
//
//  Created by Apple on 2022/03/31.
//

import UIKit

class CreationFirstSection: UIView {
    
    @IBOutlet weak var categoryImageView: UIImageView!
    @IBOutlet weak var firstTitleLabel: UILabel!
    @IBOutlet weak var firstCountLabel: UILabel!
    
    @IBOutlet weak var firstTextField: UITextField!
    @IBOutlet weak var secondTitleLabel: UILabel!
    @IBOutlet weak var secondCountLabel: UILabel!
    @IBOutlet weak var secondTextField: UITextField!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadView()
        
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadView()
    }
    private func loadView(){
       
    }

}

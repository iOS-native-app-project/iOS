//
//  MeetingCreationDetailViewController.swift
//  jaksim_ios
//
//  Created by Apple on 2022/04/05.
//

import UIKit

class MeetingCreationDetailViewController: UIViewController {

    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var creationFirstSection: CreationFirstSection!
    @IBOutlet weak var creationButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        creationButton.layer.cornerRadius = 24
        creationButton.backgroundColor = K.Color.Gray224
        creationButton.setTitleColor(.white, for: .normal)
        creationButton.titleLabel?.font = UIFont(name: K.FontName.PretendardSemiBold, size: 16)
    }
    
}

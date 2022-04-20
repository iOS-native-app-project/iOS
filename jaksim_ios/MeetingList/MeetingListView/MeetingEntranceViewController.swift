//
//  MeetingEntranceViewController.swift
//  jaksim_ios
//
//  Created by Apple on 2022/04/13.
//

import UIKit

class MeetingEntranceViewController: UIViewController {

    
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var entranceButton: UIButton!
    @IBOutlet weak var entranceLabel: UILabel!
    @IBOutlet weak var lockImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //backgroundImageView.image = backgroundImageView.image?.withRenderingMode(.alwaysTemplate)
        
        let backButtonImage = K.Image.backButton?.withRenderingMode(.alwaysTemplate)
        backButton.tintColor = .white
        backButton.setImage(backButtonImage, for: .normal)
        
        entranceButton.layer.cornerRadius = entranceButton.bounds.height/2
        entranceButton.backgroundColor = K.Color.MainPuple
        
        let lockImage = K.Image.lockIcon?.withRenderingMode(.alwaysTemplate)
        lockImageView.tintColor = .white
        lockImageView.image = lockImage
        
        entranceLabel.textColor = .white
        entranceLabel.font = UIFont(name: K.FontName.PretendardSemiBold, size: 16)
    }

    @IBAction func backButtonDidTap(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func entrancButtonDidTap(_ sender: UIButton) {
        print("버튼눌림")
    }
}

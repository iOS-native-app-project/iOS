//
//  MemberAlertViewController.swift
//  jaksim_ios
//
//  Created by 소영 on 2022/04/14.
//

import UIKit

class MemberGoodAlertViewController: UIViewController {

    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    
    var mainTitle = ""
    var content = "경고를 보낼까요? /n 10회 이상 누적 경고받은 경우 /n 자동강퇴입니다"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contentView.layer.cornerRadius = 12
        titleLabel.text = mainTitle
        contentLabel.text = content
       
    }
    

}

//
//  MemberAlertViewController.swift
//  jaksim_ios
//
//  Created by 소영 on 2022/04/14.
//

import UIKit

class MemberAlertViewController: UIViewController {

    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    
    lazy var dataManager = MemberDataManager()
    
    var userGoodBadInput = UserGoodBadRequest(userId: 0, type: 0)
    var meetingId = 0
    var type = 0
    
    var good: Bool?
    var mainTitle = ""
    var content = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contentView.layer.cornerRadius = 12
        
        if good == true {
            mainTitle = "응원하기"
            content = "응원을 보낼까요?"
        } else {
            mainTitle = "경고하기"
            content = "경고를 보낼까요? \n10회 이상 누적 경고받은 경우 \n자동강퇴입니다"
        }
        
        titleLabel.text = mainTitle
        contentLabel.text = content
       
    }
    
    @IBAction func cancleButtonAction(_ sender: UIButton) {
        self.dismiss(animated: false, completion: nil)
    }
    
    @IBAction func okButtonAction(_ sender: UIButton) {
        if good == true {
            type = 0
        } else {
            type = 1
        }
        
        userGoodBadInput = UserGoodBadRequest(userId: 1, type: type)
        dataManager.postUserGoodBad(parameters: userGoodBadInput, meetingId: meetingId, delegate: self)
    }
}

//MARK: - API
extension MemberAlertViewController {
    func successMemberGoodBad(_ result: UserGoodBadResponse) {
        print(userGoodBadInput)
        dismiss(animated: false, completion: nil)
    }
    
    func failedToResponse(message: String) {
        print(message)
    }
    
    func failedToRequest(message: String) {
        print(message)
    }
}

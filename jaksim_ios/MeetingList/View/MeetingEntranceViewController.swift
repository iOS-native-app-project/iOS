//
//  MeetingEntranceViewController.swift
//  jaksim_ios
//
//  Created by Apple on 2022/04/13.
//

import UIKit

class MeetingEntranceViewController: UIViewController {
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var entranceButtonView: UIView!
    @IBOutlet weak var entranceButton: UIButton!
    @IBOutlet weak var entranceLabel: UILabel!
    @IBOutlet weak var lockImageView: UIImageView!
    @IBOutlet weak var entranceInfoView: EntranceInfoView!
    
    var coverView :UIView?
    
    //MARK:- 데이터를 전달 받을 변수
    var meetingName: String = ""
    var descript: String = ""
    var period: String = ""
    var unit: String = ""
    var figure: Int = -1
    var category: String = ""
    var nickname: String = ""
    var userImage: String = ""
    var numberOfPeople: Int = -1
    var maximumNumber: Int = -1
    var isLocked: Bool = false
    var meetingId: String = ""

    override func viewDidLoad() {

        super.viewDidLoad()
        
        //MARK:- 비밀번호 입력화면에 나타나게될 어두운 배경 뷰
        coverView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
        coverView?.backgroundColor = UIColor.clear
        
        //MARK:- 데이터 넘기기
        entranceInfoView.meetingName = meetingName
        entranceInfoView.descript = descript
        entranceInfoView.period = period
        entranceInfoView.unit = unit
        entranceInfoView.figure = figure
        entranceInfoView.category = category
        entranceInfoView.nickname = nickname
        entranceInfoView.userImage = userImage
        entranceInfoView.numberOfPeople = numberOfPeople
        entranceInfoView.maximumNumber = maximumNumber
        
        entranceInfoView.updateData()
        
        //MARK:- 닫기 버튼
        let closeButtonImage = Constant.Image.CloseIcon?.withRenderingMode(.alwaysTemplate)
        closeButton.tintColor = .white
        closeButton.setImage(closeButtonImage, for: .normal)
        
        //MARK:- 입장 버튼
        entranceButtonView.layer.cornerRadius = entranceButton.bounds.height/2
        entranceButtonView.backgroundColor = Constant.Color.MainPuple
        
        //MARK:- 입장 버튼(라벨)
        entranceLabel.textColor = .white
        //entranceLabel.font = UIFont(name: K.FontName.PretendardSemiBold, size: 16)
        
        //MARK:- 입장 버튼(자물쇠 이미지)
        let lockImage = Constant.Image.LockIcon?.withRenderingMode(.alwaysTemplate)
        lockImageView.tintColor = .white
        lockImageView.image = lockImage
        
        if !isLocked {
            lockImageView.isHidden = true
        }
        else {
            lockImageView.isHidden = false
        }
    }
    
    //MARK:- 비밀번호입력 화면 접근시 배경 어둡게 만들기
    func addCoverView() {
        UIView.transition(with: self.coverView!, duration: 0.5, options: .transitionCrossDissolve, animations: {
            self.coverView?.backgroundColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.4)
        }, completion: nil)
    }

    @IBAction func closeButtonDidTap(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func entrancButtonDidTap(_ sender: UIButton) {
        if isLocked {
            let passwordVC = PasswordViewController(nibName: Constant.MeetingList.Name.PasswordViewControllerNibName, bundle: nil)
            passwordVC.modalPresentationStyle = .overCurrentContext
            
            passwordVC.meetingId = self.meetingId
            
            self.addCoverView()
            self.view.addSubview(self.coverView!)
            self.present(passwordVC, animated: true, completion: nil)
        }
        else {
            print("입장성공")
        }
    }
}

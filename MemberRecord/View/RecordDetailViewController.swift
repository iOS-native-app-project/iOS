//
//  RecordDetailViewController.swift
//  jaksim_ios
//
//  Created by Apple on 2022/05/17.
//

import UIKit

class RecordDetailViewController: UIViewController {

    @IBOutlet weak var superView: UIView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var closerButtonView: UIView!
    @IBOutlet weak var closeButtonImageView: UIImageView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var firstTitleLabel: UILabel!
    @IBOutlet weak var secondTitleLabel: UILabel!
    @IBOutlet weak var firstContainerView: UIView!
    @IBOutlet weak var secondContainerView: UIView!
    @IBOutlet weak var achivementValueLabel: UILabel!
    @IBOutlet weak var memoTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //MARK:- 모달뷰
        superView.layer.cornerRadius = 16
        superView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        superView.layer.masksToBounds = true
        
        //MARK:- 날짜 표시 라벨
        dateLabel.text = "2022년 3월 28일 기록"
        
        //MARK:- 닫기 버튼
        closeButton.backgroundColor = .clear
        
        closerButtonView.layer.cornerRadius = closeButton.bounds.height/2
        closerButtonView.backgroundColor = K.Color.Gray245
    
        closeButtonImageView.image = K.Image.Close
        closeButtonImageView.tintColor = .black
        
        //MARK:- 첫번째 컨테이너뷰
        firstContainerView.layer.cornerRadius = 8
        firstContainerView.backgroundColor = K.Color.Gray245
        
        //MARK:- 두번째 컨테이너뷰
        secondContainerView.layer.cornerRadius = 8
        secondContainerView.backgroundColor = K.Color.Gray245
        
    }

    //MARK:- 닫기 버튼 클릭 시 액션
    @IBAction func closeButtonDidTap(_ sender: UIButton) {
        removeCoverView()
        self.dismiss(animated: true, completion: nil)
    }
    
    //MARK:- 어두운 배경을 다시 원래대로 돌려놓기
    func removeCoverView() {
        let memberRecordVC = self.presentingViewController as! MemberRecordViewController
        UIView.transition(with: memberRecordVC.coverView!, duration: 0.5, options: .transitionCrossDissolve, animations: {
            memberRecordVC.coverView?.backgroundColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0)
        }, completion: { _ in
            memberRecordVC.coverView!.removeFromSuperview()
        })
        
    }
}

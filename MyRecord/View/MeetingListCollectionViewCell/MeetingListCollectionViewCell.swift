//
//  CollectionViewCell.swift
//  jaksim_ios
//
//  Created by Apple on 2022/03/02.
//

import UIKit

class MeetingListCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var meetingNameLabel: UILabel!    
    @IBOutlet weak var progressValueLabel: UILabel!
    @IBOutlet weak var progressTitleLabel: UILabel!
    @IBOutlet weak var progressBackBarView: UIView!
    let progressBarView = UIView()
    var progressValue = 0.0
    var progreesBarConstraint: NSLayoutConstraint?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 12
        
        //MARK:- 진행률 바 뷰
        
        self.progressBackBarView.addSubview(progressBarView)

        let progressGage = CGFloat(progressValue / 100.0 * Double(progressBackBarView.frame.width))

        progressBarView.backgroundColor = Constant.Color.MainPuple

        progressBarView.translatesAutoresizingMaskIntoConstraints = false
        progressBarView.leadingAnchor.constraint(equalTo: progressBackBarView.leadingAnchor).isActive = true
        progressBarView.centerYAnchor.constraint(equalTo:progressBackBarView.centerYAnchor)
            .isActive = true
        progressBarView.heightAnchor.constraint(equalToConstant: progressBackBarView.frame.height)
            .isActive = true
            
        progreesBarConstraint = progressBarView.widthAnchor.constraint(equalToConstant: progressGage)
        progreesBarConstraint?.isActive = true
        
        progressBarView.layer.cornerRadius = progressBackBarView.frame.height/2
        
        //MARK:- 진행률 백그라운드 바 뷰
        progressBackBarView.layer.cornerRadius = progressBackBarView.bounds.height/2
        progressBackBarView.backgroundColor = Constant.Color.Puple1
        
        //MARK:- 진행률 수치 라벨
        progressValueLabel.text = "\(String(Int(progressValue)))%"
        
    }

    //MARK:- progressValue 값이 들어오면 호출되는 함수. progressBar를 진행률 만큼 그리기
    func setProgressBar() {

        let progressGage = CGFloat(progressValue / 100.0 * Double(progressBackBarView.frame.width))
    
        progreesBarConstraint?.isActive = false
        progreesBarConstraint = progressBarView.widthAnchor.constraint(equalToConstant: progressGage)
        progreesBarConstraint?.isActive = true
        
        progressValueLabel.text = "\(String(Int(progressValue)))%"
    }
}

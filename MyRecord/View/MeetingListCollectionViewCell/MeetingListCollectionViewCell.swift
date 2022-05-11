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
    var progressValue = 50.0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 12
        
        //MARK:- 진행률 바 뷰
        progressBackBarView.addSubview(progressBarView)
        progressBarView.backgroundColor = K.Color.MainPuple
        progressBarView.translatesAutoresizingMaskIntoConstraints = false
        progressBarView.leadingAnchor.constraint(equalTo: progressBackBarView.leadingAnchor).isActive = true
        progressBarView.centerYAnchor.constraint(equalTo:progressBackBarView.centerYAnchor)
            .isActive = true
        progressBarView.heightAnchor.constraint(equalToConstant: progressBackBarView.frame.height)
            .isActive = true
        let progressGage = CGFloat(progressValue / 100.0 * Double(progressBackBarView.frame.width))
        progressBarView.widthAnchor.constraint(equalToConstant: progressGage)
            .isActive = true
        progressBarView.layer.cornerRadius = progressBackBarView.frame.height/2
        
        //MARK:- 진행률 백그라운드 바 뷰
        progressBackBarView.layer.cornerRadius = progressBackBarView.bounds.height/2
        progressBackBarView.backgroundColor = K.Color.Puple1
        
        //MARK:- 진행률 수치 라벨
        progressValueLabel.text = "\(String(Int(progressValue)))%"
        
    }

    func updateProgress() {
        let progressGage = CGFloat(progressValue / 100.0 * Double(progressBackBarView.frame.width))
        progressBarView.widthAnchor.constraint(equalToConstant: progressGage)
            .isActive = true
        
        progressValueLabel.text = "\(String(Int(progressValue)))%"
    }
}

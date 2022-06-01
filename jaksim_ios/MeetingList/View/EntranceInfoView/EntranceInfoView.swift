//
//  EntranceInfoView.swift
//  jaksim_ios
//
//  Created by Apple on 2022/04/13.
//

import UIKit

class EntranceInfoView: UIView {
    
    @IBOutlet weak var tagContainerView: UIView!
    @IBOutlet weak var tagLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var nicknameLabel: UILabel!
    @IBOutlet weak var numberOfPeopleLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadView()

    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadView()
    }
    private func loadView(){
        
        let view = Bundle.main.loadNibNamed(K.MeetingList.Name.EntranceInfoViewXibName, owner: self, options: nil)?.first as! UIView
        view.frame = self.bounds
        addSubview(view)
        
        //MARK:- 태그 라벨
        tagContainerView.layer.cornerRadius = 2
        
        //tagLabel.font = UIFont(name: K.FontName.PretendardRegular, size: 14)
        tagLabel.textColor = .white
        
        //MARK:- 모임이름라벨
        //titleLabel.font = UIFont(name: K.FontName.PretendardSemiBold, size: 26)
        titleLabel.textColor = .white
        
        //MARK:- 모임설명 라벨
        //descriptionLabel.font = UIFont(name: K.FontName.PretendardRegular, size: 15)
        descriptionLabel.textColor = .white
        
        //MARK:- 닉네임 라벨
        //nicknameLabel.font = UIFont(name: K.FontName.PretendardRegular, size: 13)
        nicknameLabel.textColor = .white
        
        //MARK:- 사람수 라벨
        //numberOfPeopleLabel.font = UIFont(name: K.FontName.PretendardRegular, size: 13)
        numberOfPeopleLabel.textColor = K.Color.Gray189
        
        //MARK:- 프로필 이미지뷰
        profileImageView.layer.cornerRadius = profileImageView.bounds.height/2
    }
    
    //MARK:- 데이터 업데이트
    func updateData() {
        tagLabel.text = "\(period) / \(figure)\(unit) / \(category)"
        titleLabel.text = "\(meetingName)"
        descriptionLabel.text = "\(descript)"
        nicknameLabel.text = "\(nickname)"
        numberOfPeopleLabel.text = "\(numberOfPeople)/\(maximumNumber)"
    }
}

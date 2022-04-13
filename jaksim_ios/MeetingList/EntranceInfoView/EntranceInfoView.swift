//
//  EntranceInfoView.swift
//  jaksim_ios
//
//  Created by Apple on 2022/04/13.
//

import UIKit

class EntranceInfoView: UIView {
    
    @IBOutlet weak var hashtagContainerView: UIView!
    @IBOutlet weak var hashtagLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var nicknameLabel: UILabel!
    @IBOutlet weak var numberOfPeopleLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    
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
        
        hashtagContainerView.layer.cornerRadius = 2
        
        hashtagLabel.font = UIFont(name: K.FontName.PretendardRegular, size: 14)
        hashtagLabel.textColor = .white
        
        titleLabel.font = UIFont(name: K.FontName.PretendardSemiBold, size: 26)
        titleLabel.textColor = .white
        
        descriptionLabel.font = UIFont(name: K.FontName.PretendardRegular, size: 15)
        descriptionLabel.textColor = .white
        
        nicknameLabel.font = UIFont(name: K.FontName.PretendardRegular, size: 13)
        nicknameLabel.textColor = .white
        
        numberOfPeopleLabel.font = UIFont(name: K.FontName.PretendardRegular, size: 13)
        numberOfPeopleLabel.textColor = K.Color.Gray189
        
        profileImageView.layer.cornerRadius = profileImageView.bounds.height/2
    }
}

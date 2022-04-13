//
//  Constant.swift
//  jaksim_ios
//
//  Created by Apple on 2022/04/05.
//


import UIKit

struct K {
    
    struct MeetingList {
        struct Name {
            static let SearchTermsCollectionViewCellXibName = "SearchTermsCollectionViewCell"
            static let MeetingListTableViewCellXibName = "MeetingListTableViewCell"
            static let EntranceInfoViewXibName = "EntranceInfoView"
            static let MeetingListStoryboardName = "MeetingList"
            
        }
        struct Id {
            static let SearchTermsCollectionViewCellId = "SearchTermsCollectionViewCell"
            static let MeetingListTableViewCellId = "MeetingListTableViewCell"
            static let MeetingEntranceViewControllerId = "MeetingEntranceViewController"
            static let MeetingListViewControllerId = "MeetingListViewController"
        }
        struct Text {

        }
    }
    struct Image {
        static let personIcon = UIImage(named: "person.png")
        static let lockIcon = UIImage(named: "lock.png")
        static let creationButton = UIImage(named: "creation.png")
        static let backButton = UIImage(named: "close.png")
    }
    struct Color {
        static let Black33 = UIColor(red: 33.0/255.0, green: 33.0/255.0, blue: 33.0/255.0, alpha: 1.0)
        static let Black66 = UIColor(red: 66.0/255.0, green: 66.0/255.0, blue: 66.0/255.0, alpha: 1.0)
        static let Black97 = UIColor(red: 97.0/255.0, green: 97.0/255.0, blue: 97.0/255.0, alpha: 1.0)
        static let Gray117 = UIColor(red: 117.0/255.0, green: 117.0/255.0, blue: 117.0/255.0, alpha: 1.0)
        static let Gray158 = UIColor(red: 158.0/255.0, green: 158.0/255.0, blue: 158.0/255.0, alpha: 1.0)
        static let Gray189 = UIColor(red: 189.0/255.0, green: 189.0/255.0, blue: 189.0/255.0, alpha: 1.0)
        static let Gray224 = UIColor(red: 224.0/255.0, green: 224.0/255.0, blue: 224.0/255.0, alpha: 1.0)
        static let Gray245 = UIColor(red: 245.0/255.0, green: 245.0/255.0, blue: 245.0/255.0, alpha: 1.0)
        static let MainPuple = UIColor(red: 85.0/255.0, green: 120.0/255.0, blue: 255.0/255.0, alpha: 1)
        
    }
    
    struct FontName {
        static let PretendardSemiBold = "Pretendard-SemiBold"
        static let PretendardRegular = "Pretendard-Regular"
    }
}

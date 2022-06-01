//
//  Constant.swift
//  jaksim_ios
//
//  Created by Acryl on 2022/05/16.
//

import Foundation
import UIKit

struct Constant {
    static var shared: Constant = Constant()
    
    private init() {}
    
    let BASE_URL = "https://jaksim.app/api/"
    //let

    //MARK:- 홈(200)
    struct Home {
        struct Name {
            static let MeetingListCollectionViewCellXibName = "MeetingListCollectionViewCell"
            static let CategoryListCollectionViewCellXibName = "CategoryListCollectionViewCell"
            static let RecommendedMeetingListCollectionViewCellXibName = "RecommendedMeetingListCollectionViewCell"
            static let NotificationListTableViewCellXibName = "NotificationListTableViewCell"
            
        }
        struct Id {
            static let MeetingListCollectionViewCellId = "MeetingListCollectionViewCell"
            static let CategoryListCollectionViewCellId = "CategoryListCollectionViewCell"
            static let RecommendedMeetingListCollectionViewCellId = "RecommendedMeetingListCollectionViewCell"
            static let NotificationListTableViewCellId = "NotificationListTableViewCell"
        }
        struct Text {
            static let CategoryList = ["미라클모닝", "공부", "시험", "글쓰기", "건강", "독서", "다이어트", "달리기"]
        }
        
    }
    
    //MARK:- 모임리스트(300)
    struct MeetingList {
        struct Name {
            static let SearchTermsCollectionViewCellXibName = "SearchTermsCollectionViewCell"
            static let MeetingListTableViewCellXibName = "MeetingListTableViewCell"
            static let EntranceInfoViewXibName = "EntranceInfoView"
            static let MeetingListStoryboardName = "MeetingList"
            static let PasswordViewControllerNibName = "PasswordViewController"
            
        }
        struct Id {
            static let SearchTermsCollectionViewCellId = "SearchTermsCollectionViewCell"
            static let MeetingListTableViewCellId = "MeetingListTableViewCell"
            static let MeetingEntranceViewControllerId = "MeetingEntranceViewController"
            static let MeetingListViewControllerId = "MeetingListViewController"
        }
        struct Text {
            static let CategoryList = [
                "미라클모닝", "공부", "시험", "글쓰기", "독서", "건강", "다이어트", "달리기"
            ]
        }
    }

    //MARK:- 기타
    struct Color {
        static let Black33 = UIColor(red: 33.0/255.0, green: 33.0/255.0, blue: 33.0/255.0, alpha: 1.0)
        static let Black66 = UIColor(red: 66.0/255.0, green: 66.0/255.0, blue: 66.0/255.0, alpha: 1.0)
        static let Black97 = UIColor(red: 97.0/255.0, green: 97.0/255.0, blue: 97.0/255.0, alpha: 1.0)
        static let Gray117 = UIColor(red: 117.0/255.0, green: 117.0/255.0, blue: 117.0/255.0, alpha: 1.0)
        static let Gray158 = UIColor(red: 158.0/255.0, green: 158.0/255.0, blue: 158.0/255.0, alpha: 1.0)
        static let Gray189 = UIColor(red: 189.0/255.0, green: 189.0/255.0, blue: 189.0/255.0, alpha: 1.0)
        static let Gray224 = UIColor(red: 224.0/255.0, green: 224.0/255.0, blue: 224.0/255.0, alpha: 1.0)
        static let Gray238 = UIColor(red: 238.0/255.0, green: 238.0/255.0, blue: 238.0/255.0, alpha: 1.0)
        static let Gray245 = UIColor(red: 245.0/255.0, green: 245.0/255.0, blue: 245.0/255.0, alpha: 1.0)
        static let MainPuple = UIColor(red: 85.0/255.0, green: 120.0/255.0, blue: 255.0/255.0, alpha: 1)
        
    }
    
    
    struct Image {
        static let LockIcon = UIImage(named: "lock.png")
        static let CreationButton = UIImage(named: "creation.png")
        static let CloseButton = UIImage(named: "close.png")
        static let PersonIcon = UIImage(named: "person.png")
        static let NoficationIcon = UIImage(named: "notification.png")
        static let HomeLogo = UIImage(named: "homeLogo.png")
        static let SirenIcon = UIImage(named: "siren.png")
        static let ThumbsUpIcon = UIImage(named: "thumbsUp.png")
        static let backButtonIcon = UIImage(named: "backButton.png")
        static let bannerImageList: [UIImage?] =
            [UIImage(named: "banner1.png"),
             UIImage(named: "banner2.png"),
             UIImage(named: "banner3.png"),
             UIImage(named: "banner4.png")]
        static let CategoryImageList: [UIImage?] =
            [ UIImage(named: "miracleMorning.png"),
              UIImage(named: "study.png"),
              UIImage(named: "writing.png"),
              UIImage(named: "reading.png"),
              UIImage(named: "diet.png"),
              UIImage(named: "exam.png"),
              UIImage(named: "health.png"),
              UIImage(named: "running.png")]
    }
    
    struct FontName{
        static let PretendardSemiBold = "Pretendard-SemiBold"
        static let PretendardRegular = "Pretendard-Regular"
        static let PretendardExtraBold = "Pretendard-ExtraBold"
        static let SCDreamRegular = "S-CoreDream-4Regular"
        static let SCDreamExtraLight = "S-CoreDream-2ExtraLight"
    }
}

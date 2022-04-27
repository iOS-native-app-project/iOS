//
//  Constant.swift
//  jaksim_ios
//
//  Created by Apple on 2022/03/03.
//
import UIKit

struct K {
    
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
    
    
    struct Image {
        static let PersonIcon = UIImage(named: "person.png")
        static let NoficationIcon = UIImage(named: "notification.png")
        static let Logo = UIImage(named: "logo.png")
        static let SirenIcon = UIImage(named: "siren.png")
        static let ThumbsUpIcon = UIImage(named: "thumbsUp.png")
        static let backButtonIcon = UIImage(named: "backButton.png")
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

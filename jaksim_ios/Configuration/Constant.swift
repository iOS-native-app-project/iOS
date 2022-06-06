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

    //MARK: - 홈(200)
    struct Home {
        struct Name {
            static let MeetingListCollectionViewCellXibName = "MeetingListCollectionViewCell"
            static let CategoryListCollectionViewCellXibName = "CategoryListCollectionViewCell"
            static let RecommendedMeetingListCollectionViewCellXibName = "RecommendedMeetingListCollectionViewCell"
            static let NotificationListTableViewCellXibName = "NotificationListTableViewCell"
            static let HomeStoryBoardName = "Home"
            
        }
        struct Id {
            static let MeetingListCollectionViewCellId = "MeetingListCollectionViewCell"
            static let CategoryListCollectionViewCellId = "CategoryListCollectionViewCell"
            static let RecommendedMeetingListCollectionViewCellId = "RecommendedMeetingListCollectionViewCell"
            static let NotificationListTableViewCellId = "NotificationListTableViewCell"
            static let HomeTabBarControllerId = "HomeTabBarController"
        }
        struct Text {
            static let CategoryList = ["미라클모닝", "공부", "시험", "글쓰기", "건강", "독서", "다이어트", "달리기"]
        }
        
    }
    
    //MARK: - 모임리스트(300)
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
    
    //MARK: - 모임생성(303)
    struct MeetingCreation {
        struct Id {
            static let MeetingCreationDetailViewControllerId = "MeetingCreationDetailViewController"
            static let CategoryCollectionViewCellId = "CategoryCollectionViewCell"
            static let MeetingCreationViewControllerId = "MeetingCreationViewController"
        }
            
        struct Name {
            static let CategoryCollectionViewCellName = "CategoryCollectionViewCell"
            static let CreationFirstSectionXibName = "CreationFirstSection"
            static let CreationSecondSectionXibName = "CreationSecondSection"
            static let CreationThirdSectionXibName = "CreationThirdSection"
            static let CreationFourthSectionXibName = "CreationFourthSection"
            static let MeetingCreationStoryBoardName = "MeetingCreation"
        }
        
        struct Text {
            static let Category = [
                ("미라클모닝", "miracleMorning"),
                ("공부", "study"),
                ("시험", "exam"),
                ("글쓰기", "writing"),
                ("독서", "reading"),
                ("건강", "health"),
                ("다이어트", "diet"),
                ("달리기", "running")]
            
            static let Title = "모임 카테고리를 선택해주세요."
            
            struct CreationFirstSection {
                static let FirstTitle = "모임명을 입력해주세요."
                static let SecondTitle = "간단하게 모임을 소개해주세요."
                static let FirstTextViewPlaceHolder = "운동할 사람?"
                static let SecondTextViewPlaceHolder = "다같이 운동합시다."
            }
            struct CreationSecondSection {
                static let Title = "인원수와 비밀번호를 설정해주세요."
            }
            struct CreationThirdSection {
                static let Title = "주기를 선택해주세요."
            }
            struct CreationFourthSection {
                static let Title = "목표치를 입력해주세요."
            }
        }
    }
    
    //MARK: - 나의기록(400)
    struct MyRecord {
        struct Id{
            static let MyRecordMeetingListCollectionViewCellId = "MyRecordMeetingListCollectionViewCell"
            static let CalendarCollectionViewCellId = "CalendarCollectionViewCell"
        }
        struct Name {
            static let MyRecordMeetingListCollectionViewCelNibName = "MyRecordMeetingListCollectionViewCell"
            static let CalendarCollectionViewCellNibName = "CalendarCollectionViewCell"
        }
    }
    
    //MARK: - 기타
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
        static let Gray250 = UIColor(red: 250.0/255.0, green: 250.0/255.0, blue: 250.0/255.0, alpha: 1.0)
        
        static let Puple1 = UIColor(red: 227.0/255.0, green: 232.0/255.0, blue: 255.0/255.0, alpha: 1)
        static let Puple2 = UIColor(red: 187.0/255.0, green: 201.0/255.0, blue: 255.0/255.0, alpha: 1)
        static let Puple3 = UIColor(red: 136.0/255.0, green: 160.0/255.0, blue: 255.0/255.0, alpha: 1)
        static let MainPuple = UIColor(red: 85.0/255.0, green: 120.0/255.0, blue: 255.0/255.0, alpha: 1)
    }
    
    
    struct Image {
        static let PrevIcon = UIImage(named: "prev.png")?.withRenderingMode(.alwaysTemplate)
        static let NextIcon = UIImage(named: "next.png")?.withRenderingMode(.alwaysTemplate)
        static let Background = UIImage(named: "background.png")
        
        static let CloseIcon = UIImage(named: "close.png")
        static let BackIcon = UIImage(named: "back.png")
        static let UpIcon = UIImage(named: "up.png")?.withRenderingMode(.alwaysTemplate)
        static let DownIcon = UIImage(named: "down.png")?.withRenderingMode(.alwaysTemplate)
        static let UncheckedIcon = UIImage(named: "unchecked.png")?.withRenderingMode(.alwaysTemplate)
        static let CheckedIcon = UIImage(named: "checked.png")?.withRenderingMode(.alwaysTemplate)
        
        static let LockIcon = UIImage(named: "lock.png")
        static let CreationButton = UIImage(named: "creation.png")
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

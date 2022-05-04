//
//  Constant.swift
//  jaksim_ios
//
//  Created by Apple on 2022/04/05.
//


import UIKit

struct K {
    
    struct MeetingCreation {
        struct Id {
            static let MeetingCreationDetailViewControllerId = "MeetingCreationDetailViewController"
            static let CategoryCollectionViewCellId = "CategoryCollectionViewCell"
        }
        struct Name {
            static let CategoryCollectionViewCellName = "CategoryCollectionViewCell"
            static let CreationFirstSectionXibName = "CreationFirstSection"
            static let CreationSecondSectionXibName = "CreationSecondSection"
            static let CreationThirdSectionXibName = "CreationThirdSection"
            static let CreationFourthSectionXibName = "CreationFourthSection"
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
    
    struct Color {
        static let Black33 = UIColor(red: 33.0/255.0, green: 33.0/255.0, blue: 33.0/255.0, alpha: 1.0)
        static let Black66 = UIColor(red: 66.0/255.0, green: 66.0/255.0, blue: 66.0/255.0, alpha: 1.0)
        static let Black97 = UIColor(red: 97.0/255.0, green: 97.0/255.0, blue: 97.0/255.0, alpha: 1.0)
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
    
    struct Image {
        static let CloseIcon = UIImage(named: "close.png")
        static let BackIcon = UIImage(named: "back.png")
        static let UpIcon = UIImage(named: "up.png")?.withRenderingMode(.alwaysTemplate)
        static let DownIcon = UIImage(named: "down.png")?.withRenderingMode(.alwaysTemplate)
        static let UncheckedIcon = UIImage(named: "unchecked.png")?.withRenderingMode(.alwaysTemplate)
        static let CheckedIcon = UIImage(named: "checked.png")?.withRenderingMode(.alwaysTemplate)
    }
}

//
//  Constant.swift
//  jaksim_ios
//
//  Created by Apple on 2022/03/21.
//

import UIKit
import Foundation

struct Constant {
    
    struct MyRecord {
        struct Id{
            static let MeetingListCollectionViewCellId = "MeetingListCollectionViewCell"
            static let CalendarCollectionViewCellId = "CalendarCollectionViewCell"
        }
        struct Name {
            static let MeetingListCollectionViewCelNibName = "MeetingListCollectionViewCell"
            static let CalendarCollectionViewCellNibName = "CalendarCollectionViewCell"
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
    }
    struct FontName {
        static let PretendardSemiBold = "Pretendard-SemiBold"
        static let PretendardRegular = "Pretendard-Regular"
    }
    
}

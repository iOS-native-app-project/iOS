//
//  Date.swift
//  jaksim_ios
//
//  Created by Acryl on 2022/05/16.
//

import Foundation

extension Date {
    
    var text: String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ko_KR")
        dateFormatter.dateFormat = "YYYY-MM-dd"
        return dateFormatter.string(from: self)
    }
}

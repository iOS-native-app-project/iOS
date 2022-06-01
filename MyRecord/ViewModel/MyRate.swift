//
//  Rate.swift
//  jaksim_ios
//
//  Created by Apple on 2022/05/25.
//

import Foundation

struct MyRate {
    var progress: Int
    
    init(_ item: MyRateItem) {
        progress = item.data
    }
}

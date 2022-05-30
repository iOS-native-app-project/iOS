//
//  Rate.swift
//  jaksim_ios
//
//  Created by Apple on 2022/05/30.
//

import Foundation

struct Rate {
    var progress: Int
    
    init(_ item: RateItem) {
        progress = item.data
    }
}

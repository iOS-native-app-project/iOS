//
//  Rate.swift
//  jaksim_ios
//
//  Created by Apple on 2022/05/24.
//

import Foundation

struct Rate {
    var progess: Int
    
    init(_ item: RateItem) {
        progess = item.data
    }
}

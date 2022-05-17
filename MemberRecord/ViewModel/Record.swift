//
//  Record.swift
//  jaksim_ios
//
//  Created by Apple on 2022/05/12.
//

import Foundation

struct Record {
    var year: Int
    var month: Int
    var day: Int
    var progress: Int
    var image: String
    
    init(_ item: RecordItem) {
        year = item.year
        month = item.month
        day = item.day
        progress = item.progress
        image = item.image
    }
}

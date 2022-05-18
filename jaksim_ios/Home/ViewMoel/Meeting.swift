//
//  Meeting.swift
//  jaksim_ios
//
//  Created by Apple on 2022/04/27.
//

import Foundation

struct Meeting {
    var name: String
    //var dDay: Int
    var progess: Int
    
    init(_ item: MeetingItem) {
        name = item.name
        progess = 73
    }
}

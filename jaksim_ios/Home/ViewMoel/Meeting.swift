//
//  Meeting.swift
//  jaksim_ios
//
//  Created by Apple on 2022/04/27.
//

import Foundation

struct Meeting {
    var name: String
    var numberOfpeople: Int
    var dDay: Int
    var progess: Int
    
    init(_ item: MeetingItem) {
        name = item.name
        numberOfpeople = item.numberOfpeople
        dDay = item.dDay
        progess = item.progess
    }
}

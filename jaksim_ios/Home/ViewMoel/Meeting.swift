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
    var meetingId: Int
    
    init(_ item: MeetingItem) {
        name = item.name
        progess = 100
        meetingId = item.id
    }
}

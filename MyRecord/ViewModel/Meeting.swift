//
//  Meeting.swift
//  jaksim_ios
//
//  Created by Apple on 2022/05/12.
//

import Foundation

struct Meeting {
    var name: String
    //var dDay: Int
    var progress: Int
    var meetingId: Int
    
    init(_ item: MeetingItem) {
        name = item.name
        progress = 100
        meetingId = item.id
    }
}

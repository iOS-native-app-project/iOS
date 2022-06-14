//
//  Meeting.swift
//  jaksim_ios
//
//  Created by Apple on 2022/04/27.
//

import Foundation

struct AttendedMeeting {
    var name: String
    //var dDay: Int
    var progress: Int
    var meetingId: Int
    var target_amount: Int
    
    init(_ item: AttendedMeetingItem) {
        name = item.name
        progress = 100
        meetingId = item.id
        target_amount = 0
    }
}

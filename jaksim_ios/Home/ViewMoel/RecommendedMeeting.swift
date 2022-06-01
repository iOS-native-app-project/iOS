//
//  RecommendedMeeting.swift
//  jaksim_ios
//
//  Created by Apple on 2022/04/27.
//

import Foundation

struct RecommendedMeeting {
    var name: String
    var numberOfpeople: Int
    var descript: String
    var image: String?
    
    init(_ item: RecommendedMeetingItem) {
        name = item.meeting_name
        numberOfpeople = item.memberCount
        descript = item.meeting_descript
        image = item.meeting_image
    }
}

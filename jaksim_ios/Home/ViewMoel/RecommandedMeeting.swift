//
//  RecommandedMeeting.swift
//  jaksim_ios
//
//  Created by Apple on 2022/04/27.
//

import Foundation

struct RecommandedMeeting {
    var name: String
    var numberOfpeople: Int
    var introduction: String
    init(_ item: RecommandedMeetingItem) {
        name = item.name
        numberOfpeople = item.numberOfpeople
        introduction = item.introduction
    }
}

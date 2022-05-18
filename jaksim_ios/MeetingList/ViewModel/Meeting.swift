//
//  Meeting.swift
//  jaksim_ios
//
//  Created by Apple on 2022/04/20.
//

import Foundation

struct Meeting {
    var meetingId: String
    var name: String
    var maximumNumber: Int
    var isLocked: Bool
    var descript: String
    var period: Int
    var unit: String
    var figure: Int
    var category: String
    var nickname: String
    var userImage: String
    var numberOfPeople: Int
    
    init(_ item: MeetingItem) {
        meetingId = String(item.id)
        name = item.name
        maximumNumber = item.limit
        isLocked = item.password == "true" ? true : false
        descript = item.descript
        period = item.cycle
        unit = item.unit
        figure = item.targetAmount
        category = item.category.name
        nickname = item.users.nickname
        userImage = item.users.imagePath ?? ""
        numberOfPeople = item.memberCount
    }
}

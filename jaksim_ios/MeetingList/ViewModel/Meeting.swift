//
//  Meeting.swift
//  jaksim_ios
//
//  Created by Apple on 2022/04/20.
//

import Foundation

struct Meeting {
    var name: String
    var numberOfpeople: Int
    var isLocked: Bool
    
    init(_ item: MeetingItem) {
        name = item.name
        numberOfpeople = item.numberOfpeople
        isLocked = item.isLocked
    }
}

//
//  MeetingItem.swift
//  jaksim_ios
//
//  Created by Apple on 2022/04/20.
//

import Foundation

struct MeetingItem: Decodable {
    var name: String
    var numberOfpeople: Int
    var isLocked: Bool
}

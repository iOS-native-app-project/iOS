//
//  MeetingItem.swift
//  jaksim_ios
//
//  Created by Apple on 2022/04/27.
//

import Foundation

struct MeetingItem: Decodable {
    var name: String
    var numberOfpeople: Int
    var dDay: Int
    var progess: Int
}

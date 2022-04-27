//
//  RecommandedMeetingItem.swift
//  jaksim_ios
//
//  Created by Apple on 2022/04/27.
//

import Foundation

struct RecommandedMeetingItem: Decodable {
    var name: String
    var numberOfpeople: Int
    var introduction: String
}

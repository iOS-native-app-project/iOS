//
//  File.swift
//  jaksim_ios
//
//  Created by Apple on 2022/05/10.
//

import Foundation

struct MeetingCreationItem: Encodable {
//    var id: Int
    var name: String
    var image: String
    var categoryId: Int
    var descript: String
    var limit: Int
//    var ownerId: Int
    var password: String
    var cycle: Int
    var unit: String
    var targetAmount: Int
//    var round: Int
//    var memberCount: Int
//    var join: Bool
}

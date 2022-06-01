//
//  MeetingItem.swift
//  jaksim_ios
//
//  Created by Apple on 2022/04/20.
//

import Foundation

struct MeetingDataItem: Decodable {
    var success: Bool
    var statusCode: Int
    var data: [MeetingItem]
}

struct MeetingItem: Decodable {
    var id: Int
    var name: String
    var image: String
    var categoryId: Int
    var descript: String
    var limit: Int
    var ownerId: Int
    var password: String
    var cycle: Int
    var unit: String
    var targetAmount: Int
    var round: Int
    var users: UserItem
    var category: CategoryItem
    var memberCount: Int
    var join: Bool
}

struct UserItem: Decodable {
    var id: Int
    var uid: String
    var nickname: String
    var imagePath: String?
}

struct CategoryItem: Decodable {
    var id: Int
    var name: String
}

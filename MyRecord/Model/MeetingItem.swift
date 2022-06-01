//
//  MeetingItem.swift
//  jaksim_ios
//
//  Created by Apple on 2022/05/12.
//

import Foundation

struct MeetingDataItem: Decodable {
    var success: Bool
    var statusCode: Int
    var data: [MeetingItem]
}

struct MeetingItem: Decodable {
    var id: Int
    var created_at: String
    var updated_at: String
    var name: String
    var image: String
    var category_id: Int
    var descript: String
    var limit: Int
    var owner_id: Int
    var password: String
    var cycle: Int
    var unit: String
    var target_amount: Int
    var round: Int
}

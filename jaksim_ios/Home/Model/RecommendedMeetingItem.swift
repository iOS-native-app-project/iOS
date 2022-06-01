//
//  RecommendedMeetingItem.swift
//  jaksim_ios
//
//  Created by Apple on 2022/04/27.
//

import Foundation

struct RecommendedMeetingDataItem: Decodable {
    var success: Bool
    var statusCode: Int
    var data: [RecommendedMeetingItem]
}

struct RecommendedMeetingItem: Decodable {
    var meeting_id: Int
    var meeting_name: String
    var meeting_image: String
    var meeting_descript: String
    var meeting_limit: Int
    var meeting_cycle: Int
    var meeting_unit: String
    var meeting_target_amount: Int
    var user_id: Int
    var user_uid: String
    var user_nickname: String
    var user_image_path: String?
    var category_id: Int
    var category_name: String
    var memberCount: Int
}

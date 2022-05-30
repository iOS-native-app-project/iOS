//
//  RecordItem.swift
//  jaksim_ios
//
//  Created by Apple on 2022/05/12.
//

import Foundation

struct RecordDataItem: Decodable {
    var success: Bool
    var statusCode: Int
    var data: [RecordItem]?
}

struct RecordItem: Decodable {
    var id: Int
    var meetingUserId: Int
    var meetingId: Int
    var date: String
    var value: Int
    var image: String?
    var descript: String?
}

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
    var data: [RecordItem]
}

struct RecordItem: Decodable {
    var year: Int
    var month: Int
    var day: Int
    var progress: Int
    var image: String
}

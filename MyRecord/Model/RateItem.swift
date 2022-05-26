//
//  RateItem.swift
//  jaksim_ios
//
//  Created by Apple on 2022/05/25.
//

import Foundation

struct RateItem: Decodable {
    var success: Bool
    var statusCode: Int
    var data: Int
}

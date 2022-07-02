//
//  MeetingRateResponse.swift
//  jaksim_ios
//
//  Created by 소영 on 2022/07/02.
//

import Foundation

struct MeetingRateResponse: Decodable {
    var success: Bool
    var statusCode: Int
    var data: Int // ex) 달성률 : 40%
}

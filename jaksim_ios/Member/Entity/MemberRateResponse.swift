//
//  MemberRateResponse.swift
//  jaksim_ios
//
//  Created by 소영 on 2022/07/02.
//

import Foundation

struct MemeberRateResponse: Decodable {
    var success: Bool
    var statusCode: Int
    var data: MemeberRateResult?
}

struct MemeberRateResult: Decodable {
    var memberRate: [MemeberRateLists]?
    var meetingDate: MemberMeetingDate?
}

struct MemeberRateLists: Decodable {
    var userId: Int
    var nickname: String
    var recommand: Int
    var report: Int
    var rate: Int
}

struct MemberMeetingDate: Decodable {
    var startDate: String
    var endDate: String
}

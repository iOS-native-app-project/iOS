//
//  MyRecordResponse.swift
//  jaksim_ios
//
//  Created by Acryl on 2022/05/16.
//

struct MyRecordResponse: Decodable {
    var success: Bool
    var statusCode: Int
    var data: [MyRecordResult]?
}

struct MyRecordResult: Decodable {
    var id: Int // record id
    var meetingUserId: Int
    var meetingId: Int
    var date: String // 모임 기록 날짜
    var value: Int // 상세달성수치
    var image: String // 이미지
    var descript: String // 설명
}

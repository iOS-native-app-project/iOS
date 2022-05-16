//
//  MyRecordRequest.swift
//  jaksim_ios
//
//  Created by Acryl on 2022/05/16.
//

struct MyRecordRequest: Encodable {
    var date: String
    var value: String // 상세달성수치
    var image: String
    var descript: String
}

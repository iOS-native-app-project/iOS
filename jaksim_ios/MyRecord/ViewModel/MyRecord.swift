//
//  Record.swift
//  jaksim_ios
//
//  Created by Apple on 2022/05/12.
//

import Foundation

struct MyRecord {
    var recordId : Int
    var meetingId: Int
    var userId: Int
    var year: Int
    var month: Int
    var day: Int
    var value: Int
    var image: String?
    var descript: String
    
    init(_ item: MyRecordItem) {
        let date = item.date.split(separator: "-")
        recordId = item.id
        meetingId = item.meetingId
        userId = item.meetingUserId
        year = Int(date[0]) ?? 0
        month = Int(date[1]) ?? 0
        let arrForDay = Array(String(date[2])).map{String($0)}
        day = Int(arrForDay[0]+arrForDay[1]) ?? 0
        value = item.value
        image = item.image ?? ""
        descript = item.descript ?? ""
    }
}

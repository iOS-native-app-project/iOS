//
//  MeetingViewModel.swift
//  jaksim_ios
//
//  Created by Apple on 2022/05/10.
//

import Foundation
import RxSwift

class MeetingCreationViewModel {
    var url = "https://jaksim.app/api/meeting"
    var meetingItem: MeetingCreationItem
    
    init(name: String,
        image: String,
        categoryId: Int,
        descript: String,
        limit: Int,
        password: String,
        cycle: Int,
        unit: String,
        targetAmount: Int
         ) {
        meetingItem = MeetingCreationItem(name: name, image: image, categoryId: categoryId, descript: descript, limit: limit, password: password, cycle: cycle, unit: unit, targetAmount: targetAmount)
    }
    
    func createMeeting() {
        MeetingCreationService.postMeeting(from: url, item: meetingItem)
    }
}

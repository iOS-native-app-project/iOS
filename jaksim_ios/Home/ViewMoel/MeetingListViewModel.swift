//
//  MeetingListViewModel.swift
//  jaksim_ios
//
//  Created by Apple on 2022/04/27.
//

import Foundation
import RxSwift

class MeetingListViewModel {
    let disposeBag = DisposeBag()
    var meetingListSubject = BehaviorSubject<[Meeting]>(value: [])
    
    init() {
//        MeetingListService.tmpService(from: "url")
//            .map { meetingList in
//                meetingList.map {
//                    Meeting($0)
//                }
//            }
//            .subscribe(onNext: {
//                self.meetingListSubject.onNext($0)
//            },
//            onError: { error in
//                print(error)
//            })
//            .disposed(by: disposeBag)
        
        let meetingList: [Meeting] = [
            Meeting(MeetingItem(name: "임시 모임1", numberOfpeople: 5, dDay: 5, progess: 12)),
            Meeting(MeetingItem(name: "임시 모임2", numberOfpeople: 5, dDay: 5, progess: 25)),
            Meeting(MeetingItem(name: "임시 모임3", numberOfpeople: 5, dDay: 5, progess: 44)),
            Meeting(MeetingItem(name: "임시 모임4", numberOfpeople: 5, dDay: 5, progess: 56)),
            Meeting(MeetingItem(name: "임시 모임5", numberOfpeople: 5, dDay: 5, progess: 88))
            
        ]
        
        meetingListSubject.onNext(meetingList)
    }
}

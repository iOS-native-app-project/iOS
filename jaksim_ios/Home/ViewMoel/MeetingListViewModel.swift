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
            Meeting(MeetingItem(name: "임시 모임", numberOfpeople: 5, dDay: 5, progess: 50)),
            Meeting(MeetingItem(name: "임시 모임", numberOfpeople: 5, dDay: 5, progess: 50)),
            Meeting(MeetingItem(name: "임시 모임", numberOfpeople: 5, dDay: 5, progess: 50)),
            Meeting(MeetingItem(name: "임시 모임", numberOfpeople: 5, dDay: 5, progess: 50)),
            Meeting(MeetingItem(name: "임시 모임", numberOfpeople: 5, dDay: 5, progess: 50))
            
        ]
        
        meetingListSubject.onNext(meetingList)
    }
}

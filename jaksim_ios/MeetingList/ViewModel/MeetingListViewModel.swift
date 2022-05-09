//
//  MeetingListViewModel.swift
//  jaksim_ios
//
//  Created by Apple on 2022/04/20.
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
            Meeting(MeetingItem(name: "가나다라", numberOfpeople: 3, isLocked: true)),
            Meeting(MeetingItem(name: "가나", numberOfpeople: 3, isLocked: true)),
            Meeting(MeetingItem(name: "다사과", numberOfpeople: 3, isLocked: true)),
            Meeting(MeetingItem(name: "쿠쿠다스", numberOfpeople: 3, isLocked: true)),
            Meeting(MeetingItem(name: "aa", numberOfpeople: 3, isLocked: true)),
            Meeting(MeetingItem(name: "AA", numberOfpeople: 3, isLocked: true))
        ]
        
        meetingListSubject.onNext(meetingList)
    }
}

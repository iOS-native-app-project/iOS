//
//  SayingOfTodayViewModel.swift
//  jaksim_ios
//
//  Created by Apple on 2022/04/27.
//

import Foundation
import RxSwift

class SayingOfTodayViewModel {
    let disposeBag = DisposeBag()
    var sayingOfTodaySubject = BehaviorSubject<SayingOfToday>(value: SayingOfToday(SayingOfTodayItem(sayingOfToday: "실패란 넘어지는 것이 아니라, 넘어진 자리에 머무는 것이다.")))
    
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
        
        sayingOfTodaySubject.onNext(SayingOfToday(SayingOfTodayItem(sayingOfToday: "실패란 넘어지는 것이 아니라, 넘어진 자리에 머무는 것이다.")))
    }
}


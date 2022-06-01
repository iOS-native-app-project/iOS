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
    let url = "https://jaksim.app/api/meeting/main"
    
    init() {
        HomeService.getAttendedMeetingList(from: url)
            .map { meetingList in
                meetingList.map {
                    Meeting($0)
                }
            }
            .subscribe(onNext: {
                self.meetingListSubject.onNext($0)
            },
            onError: { error in
                print(error)
            })
            .disposed(by: disposeBag)
    }
}

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
    var url = "https://jaksim.app/api/meeting"
    
    init() {
        MeetingListService.getMeetingList(from: url)
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
    
    func updateMeetingList() {
        MeetingListService.getMeetingList(from: url)
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

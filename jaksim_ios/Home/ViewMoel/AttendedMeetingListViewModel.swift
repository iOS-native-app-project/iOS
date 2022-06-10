//
//  MeetingListViewModel.swift
//  jaksim_ios
//
//  Created by Apple on 2022/04/27.
//

import Foundation
import RxSwift

class AttendedMeetingListViewModel {
    let disposeBag = DisposeBag()
    var meetingListSubject = BehaviorSubject<[AttendedMeeting]>(value: [])
    let url = "https://jaksim.app/api/meeting/main"
    
    init() {
        HomeService.getAttendedMeetingList(from: url)
            .map { meetingList in
                meetingList.map {
                    AttendedMeeting($0)
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
    
    func fetchMeetingList() {
        HomeService.getAttendedMeetingList(from: url)
            .map { meetingList in
                meetingList.map {
                    AttendedMeeting($0)
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

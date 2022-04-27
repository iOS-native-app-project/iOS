//
//  RecommandedMeetingListViewModel.swift
//  jaksim_ios
//
//  Created by Apple on 2022/04/27.
//

import Foundation
import RxSwift

class RecommandedMeetingListViewModel {
    let disposeBag = DisposeBag()
    var recommandedMeetingListSubject = BehaviorSubject<[RecommandedMeeting]>(value: [])
    
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
        
        let recommandedMeetingList: [RecommandedMeeting] = [
            RecommandedMeeting(RecommandedMeetingItem(name: "추천모임1", numberOfpeople: 4, introduction: "한줄소개한줄소개한줄소개한줄소개")),
            RecommandedMeeting(RecommandedMeetingItem(name: "추천모임2", numberOfpeople: 4, introduction: "한줄소개한줄소개한줄소개한줄소개")),
            RecommandedMeeting(RecommandedMeetingItem(name: "추천모임3", numberOfpeople: 4, introduction: "한줄소개한줄소개한줄소개한줄소개")),
            RecommandedMeeting(RecommandedMeetingItem(name: "추천모임4", numberOfpeople: 4, introduction: "한줄소개한줄소개한줄소개한줄소개")),
            RecommandedMeeting(RecommandedMeetingItem(name: "추천모임5", numberOfpeople: 4, introduction: "한줄소개한줄소개한줄소개한줄소개")),
            RecommandedMeeting(RecommandedMeetingItem(name: "추천모임6", numberOfpeople: 4, introduction: "한줄소개한줄소개한줄소개한줄소개")),
            RecommandedMeeting(RecommandedMeetingItem(name: "추천모임7", numberOfpeople: 4, introduction: "한줄소개한줄소개한줄소개한줄소개"))
            
        ]
        
        recommandedMeetingListSubject.onNext(recommandedMeetingList)
    }
}


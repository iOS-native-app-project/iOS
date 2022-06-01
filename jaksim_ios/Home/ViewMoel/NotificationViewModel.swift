//
//  NotificationViewModel.swift
//  jaksim_ios
//
//  Created by Apple on 2022/04/27.
//

import Foundation
import RxSwift

class NotificationViewModel {
    let disposeBag = DisposeBag()
    var notificationListSubject = BehaviorSubject<[Notification]>(value: [])
    
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
        
        notificationListSubject.onNext(
            [Notification(NotificationItem(content: "[한달간 5km 달리기 모임]에서 응원 1개 받았어요.", date: "2022.03.27 17:30:05", noti: 1)),
            Notification(NotificationItem(content: "[한달간 5km 달리기 모임]에서 응원 1개 받았어요.", date: "2022.03.27 17:30:05", noti: 0)),
            Notification(NotificationItem(content: "[한달간 5km 달리기 모임]에서 응원 1개 받았어요.", date: "2022.03.27 17:30:05", noti: 0)),
            Notification(NotificationItem(content: "[한달간 5km 달리기 모임]에서 응원 1개 받았어요.", date: "2022.03.27 17:30:05", noti: 1)),
            Notification(NotificationItem(content: "[한달간 5km 달리기 모임]에서 응원 1개 받았어요.", date: "2022.03.27 17:30:05", noti: 1)),
            Notification(NotificationItem(content: "[한달간 5km 달리기 모임]에서 응원 1개 받았어요.", date: "2022.03.27 17:30:05", noti: 0)),
            Notification(NotificationItem(content: "[한달간 5km 달리기 모임]에서 응원 1개 받았어요.", date: "2022.03.27 17:30:05", noti: 1)),
            Notification(NotificationItem(content: "[한달간 5km 달리기 모임]에서 응원 1개 받았어요.", date: "2022.03.27 17:30:05", noti: 0)),
            Notification(NotificationItem(content: "[한달간 5km 달리기 모임]에서 응원 1개 받았어요.", date: "2022.03.27 17:30:05", noti: 1)),
            Notification(NotificationItem(content: "[한달간 5km 달리기 모임]에서 응원 1개 받았어요.", date: "2022.03.27 17:30:05", noti: 1)),
            Notification(NotificationItem(content: "[한달간 5km 달리기 모임]에서 응원 1개 받았어요.", date: "2022.03.27 17:30:05", noti: 1))]
        )
    }
}


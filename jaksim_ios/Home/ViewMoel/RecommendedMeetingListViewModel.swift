//
//  RecommendedMeetingListViewModel.swift
//  jaksim_ios
//
//  Created by Apple on 2022/04/27.
//

import Foundation
import RxSwift

class RecommendedMeetingListViewModel {
    let disposeBag = DisposeBag()
    var recommendedMeetingListSubject = BehaviorSubject<[RecommendedMeeting]>(value: [])
    let url = "https://jaksim.app/api/meeting/main/recommend"
    
    init() {
        HomeService.getRecommendedMeetingList(from: url)
            .map { recommendedMeetingList in
                recommendedMeetingList.map {
                    RecommendedMeeting($0)
                }
            }
            .subscribe(onNext: {
                self.recommendedMeetingListSubject.onNext($0)
            },
            onError: { error in
                print(error)
            })
            .disposed(by: disposeBag)
    }
}


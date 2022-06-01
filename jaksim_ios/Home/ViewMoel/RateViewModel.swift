//
//  RateViewModel.swift
//  jaksim_ios
//
//  Created by Apple on 2022/05/24.
//

import Foundation

import Foundation
import RxSwift

class RateViewModel {
    let disposeBag = DisposeBag()
    var rateSubject = PublishSubject<Rate>()
    var url = ""
    
    func updateMeetingId(meetingId: String) {
        self.url = "https://jaksim.app/api/meeting/\(meetingId)/my/rate"
    }
    
    func fetchProgress() {
        HomeService.getRate(from: url)
            .subscribe(onNext: {
                self.rateSubject.onNext(Rate($0))
            },
            onError: { error in
                print(error)
            })
            .disposed(by: disposeBag)
    }
}

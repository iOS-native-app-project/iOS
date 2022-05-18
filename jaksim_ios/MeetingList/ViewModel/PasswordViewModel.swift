//
//  PasswordViewModel.swift
//  jaksim_ios
//
//  Created by Apple on 2022/05/18.
//

import Foundation
import RxSwift

class PasswordViewModel {
    let disposeBag = DisposeBag()
    var passwordSubject = PublishSubject<PasswordResponse>()
    var meetingId = ""
    var url = ""
    var passwordRequestItem = PasswordRequestItem(password: "")
    
    func updateMeetingId(meetingId: String) {
        url = "https://jaksim.app/api/meeting/\(meetingId)/check/password"
    }
    
    func checkPassword(password: String) {
        passwordRequestItem.password = password
        MeetingListService.postPassword(from: url, item: passwordRequestItem)
            .subscribe(onNext: {
                self.passwordSubject.onNext(PasswordResponse($0))
            },
            onError: { error in
                print(error)
            })
            .disposed(by: disposeBag)

    }
}

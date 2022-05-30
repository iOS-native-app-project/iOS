//
//  RecordListViewModel.swift
//  jaksim_ios
//
//  Created by Apple on 2022/05/12.
//

import Foundation
import RxSwift

class RecordListViewModel {
    let disposeBag = DisposeBag()
    var recordListSubject = BehaviorSubject<[Record]>(value: [])
    var url = ""
    
    func fetchRecord(meetingId: Int, year: Int, month: Int) {
        url = "https://jaksim.app/api/meeting/\(String(meetingId))/record?year=\(String(year))&month=\(String(month))"
        
        MemberRecordService.getRecordList(from: url, meetingId: meetingId, year: year, month: month)
            .map { recordList in
                recordList.map {
                    Record($0)
                }
            }
            .subscribe(onNext: {
                self.recordListSubject.onNext($0)
            },
            onError: { error in
                print(error)
            })
            .disposed(by: disposeBag)
    }
}

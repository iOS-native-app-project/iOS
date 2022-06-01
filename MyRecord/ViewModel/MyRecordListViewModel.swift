//
//  RecordListViewModel.swift
//  jaksim_ios
//
//  Created by Apple on 2022/05/12.
//

import Foundation
import RxSwift

class MyRecordListViewModel {
    let disposeBag = DisposeBag()
    var recordListSubject = BehaviorSubject<[MyRecord]>(value: [])
    var url = ""
    
    func fetchRecord(meetingId: Int, year: Int, month: Int) {
        url = "https://jaksim.app/api/meeting/\(String(meetingId))/record?year=\(String(year))&month=\(String(month))"
        
        MyRecordService.getRecordList(from: url, meetingId: meetingId, year: year, month: month)
            .map { recordList in
                recordList.map {
                    MyRecord($0)
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

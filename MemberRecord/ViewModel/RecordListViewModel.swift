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
    
    init() {
        MemberRecordService.getRecordList(from: url)
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
        
        let recordList: [Record] = [

        ]

        recordListSubject.onNext(recordList)
    }
}

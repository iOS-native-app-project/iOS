//
//  SearchTermListViewModel.swift
//  jaksim_ios
//
//  Created by Apple on 2022/04/21.
//

import Foundation
import RxSwift

class SearchTermListViewModel {
    let disposeBag = DisposeBag()
    var searchTermListSubject = BehaviorSubject<[SearchTerm]>(value: [])
    
    init() {
//        SearchTermListService.tmpService(from: "url")
//            .map { searchTermList in
//                searchTermList.map {
//                    SearchTerm($0)
//                }
//            }
//            .subscribe(onNext: {
//                self.searchTermListSubject.onNext($0)
//            },
//            onError: { error in
//                print(error)
//            })
//            .disposed(by: disposeBag)
        
        let searchTermList: [SearchTerm] = [
            SearchTerm(SearchTermItem(name: "검색어어")),
            SearchTerm(SearchTermItem(name: "검색어어")),
            SearchTerm(SearchTermItem(name: "검색어어")),
            SearchTerm(SearchTermItem(name: "검색어어")),
            SearchTerm(SearchTermItem(name: "검색어어")),
            SearchTerm(SearchTermItem(name: "검색어어"))
        ]
        
        searchTermListSubject.onNext(searchTermList)
    }
}

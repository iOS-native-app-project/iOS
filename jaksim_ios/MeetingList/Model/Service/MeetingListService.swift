//
//  MeetingListService.swift
//  jaksim_ios
//
//  Created by Apple on 2022/04/20.
//

import Foundation
import Alamofire
import RxSwift

struct MeetingListService {
    
    var url = "https://jaksim.app/api/meeting"
    
    static func getMeetingList(from url: String) -> Observable<[MeetingItem]> {
        return Observable.create { emitter in
            
            let urlString = url
            let header: HTTPHeaders = ["Content-Type": "application/json"]
            
            let request = AF.request(urlString,
                                     method: .get,
                                     encoding: JSONEncoding.default,
                                     headers: header)
            
            request.validate(statusCode: 200...500).responseString { response in
                switch response.result {
                case .success:
                    if let data = response.data {
                        do {
                            let responseDecoded = try JSONDecoder().decode(MeetingDataItem.self, from: data).data
                            emitter.onNext(responseDecoded)
                        } catch let error as NSError{
                            emitter.onError(error)
                            return
                        }
                    }
                    
                case .failure(let error):
                    emitter.onError(error)
                    return
                }
            }
            
            return Disposables.create()
        }
    }
}


//
//  Service.swift
//  jaksim_ios
//
//  Created by Apple on 2022/05/12.
//

import Foundation
import Alamofire
import RxSwift

struct MemberRecordService {
    
    static func getMeetingList(from url: String) -> Observable<[MeetingItem]> {
        return Observable.create { emitter in
            let urlString = url
            let header: HTTPHeaders = [.authorization(bearerToken: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6Mywibmlja25hbWUiOiLspJHqt5wiLCJpYXQiOjE2NTIxODc2MDYsImV4cCI6MTY1MjE4OTQwNn0.jOFdUeXA5XdSMOqJofKVEbhuy-Hk-YXDU8Dz46jduhk")]
                
            
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
                            print("catch error: \(error)")
                            return
                        }
                    }
                    
                case .failure(let error):
                    print("failure error: \(error)")
                    emitter.onError(error)
                    return
                }
            }
            
            return Disposables.create()
        }
    }
    
    static func getRecordList(from url: String) -> Observable<[RecordItem]> {
        return Observable.create { emitter in
            let urlString = url
            let header: HTTPHeaders = [.authorization(bearerToken: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6Mywibmlja25hbWUiOiLspJHqt5wiLCJpYXQiOjE2NTIxODc2MDYsImV4cCI6MTY1MjE4OTQwNn0.jOFdUeXA5XdSMOqJofKVEbhuy-Hk-YXDU8Dz46jduhk")]
                
            
            let request = AF.request(urlString,
                                     method: .get,
                                     encoding: JSONEncoding.default,
                                     headers: header)
            
            request.validate(statusCode: 200...500).responseString { response in
                switch response.result {
                case .success:
                    if let data = response.data {
                        do {
                            let responseDecoded = try JSONDecoder().decode(RecordDataItem.self, from: data).data
                            emitter.onNext(responseDecoded)
                        } catch let error as NSError{
                            emitter.onError(error)
                            print("catch error: \(error)")
                            return
                        }
                    }
                    
                case .failure(let error):
                    print("failure error: \(error)")
                    emitter.onError(error)
                    return
                }
            }
            
            return Disposables.create()
        }
    }

}

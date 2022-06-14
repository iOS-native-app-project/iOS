//
//  Service.swift
//  jaksim_ios
//
//  Created by Apple on 2022/05/12.
//

import Foundation
import Alamofire
import RxSwift

struct MyRecordService {
    
    static func getRecordList(from url: String, meetingId: Int, year: Int, month: Int) -> Observable<[MyRecordItem]> {
        return Observable.create { emitter in
            let urlString = url
            let header: HTTPHeaders = [.authorization(bearerToken: UserDefaults.standard.string(forKey: "Token")!)]
                
            
            let request = AF.request(urlString,
                                     method: .get,
                                     encoding: JSONEncoding.default,
                                     headers: header)
            
            request.validate(statusCode: 200...500).responseString { response in
                switch response.result {
                case .success:
                    if let data = response.data {
                        do {
                            let responseDecoded = try JSONDecoder().decode(MyRecordDataItem.self, from: data).data
                            emitter.onNext(responseDecoded ?? [MyRecordItem]())
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
    
    static func getRate(from url: String) -> Observable<MyRateItem> {
            return Observable.create { emitter in
                
                let urlString = url
                let header: HTTPHeaders = [.authorization(bearerToken: UserDefaults.standard.string(forKey: "Token")!)]
                
                let request = AF.request(urlString,
                                         method: .get,
                                         encoding: JSONEncoding.default,
                                         headers: header)
                
                request.validate(statusCode: 200...500).responseString { response in
                    switch response.result {
                    case .success:
                        if let data = response.data {
                            do {
                                let responseDecoded = try JSONDecoder().decode(MyRateItem.self, from: data)
                                emitter.onNext(responseDecoded)
                            }catch let error as NSError{
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

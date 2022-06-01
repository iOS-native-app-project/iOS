//
//  Service.swift
//  jaksim_ios
//
//  Created by Apple on 2022/05/10.
//

import Foundation
import Alamofire

struct MeetingCreationService {
    static func postMeeting(from url: String, item: MeetingCreationItem) -> Void {
        
        let urlString = url
        let header: HTTPHeaders = [.authorization(bearerToken: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6Mywibmlja25hbWUiOiLspJHqt5wiLCJpYXQiOjE2NTIxOTUzNzAsImV4cCI6MTY1MjE5NzE3MH0.eg6ZSECHHzSaCyADN8XfJXCZxALu774k_nfZHIocCvM")]
        
        let request = AF.request(urlString,
                                 method: .post,
                                 parameters: item,
                                 encoder: JSONParameterEncoder.default,
                                 headers: header)
        
        request.validate(statusCode: 200...500).responseString { response in
            print(response)
            switch response.result {
            case .success:
                print("success")
                return
                
            case .failure(let error):
                print("failure error: \(error)")
                return
            }
        }
    }
    
}

//
//  MemberDataManager.swift
//  jaksim_ios
//
//  Created by 소영 on 2022/04/26.
//

import Alamofire

class MemberDataManager {
    
    func postUserGoodBad(parameters: UserGoodBadRequest, meetingId: Int, delegate: MemberAlertViewController) {
        let headers: HTTPHeaders = [.authorization(bearerToken: "")]
       
        AF.request("https://jaksim.app/api/meeting-user/\(meetingId)/report", method: .post, parameters: parameters, encoder: JSONParameterEncoder.default, headers: headers)
            .validate()
            .responseDecodable(of: UserGoodBadResponse.self) { response in
                switch response.result {
                case .success(let response):
                    if response.success, let result = response.data {
                        delegate.successMemberGoodBad(response)
                    } else {
                        delegate.failedToResponse(message: "불러오기 실패")
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                    delegate.failedToRequest(message: "서버 연결 실패")
                }
            }
    }
}

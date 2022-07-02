//
//  MemberHomeResponse.swift
//  jaksim_ios
//
//  Created by 소영 on 2022/07/02.
//

import Foundation

struct MemeberHomeResponse: Decodable {
      var success: Bool
      var statusCode: Int
      var data: MemberHomeResult?
}

struct MemberHomeResult: Decodable {
    var meeting_id: Int
    //"meeting_created_at": "2022-04-22T07:55:03.000Z",
    var meeting_name: String
    var meeting_image: String
    var meeting_descript: String
    var meeting_limit: Int
    //"meeting_cycle": 1,
    //"meeting_unit": "시간",
    //"meeting_target_amount": 20,
    //"meeting_round": 3,
    
          // 모임 주최자 정보
    //"user_id": 2, // 모임 주최자 id
    //"user_uid": "",
    //"user_nickname": "지선", // 모임 주최자 닉네임
    //"user_image_path": null,
          // 모임 카테고리 정보
    //"category_id": 1,
    //"category_name": "공부"
}

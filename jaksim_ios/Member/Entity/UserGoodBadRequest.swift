//
//  UserGoodRequest.swift
//  jaksim_ios
//
//  Created by Acryl on 2022/05/16.
//

struct UserGoodBadRequest: Encodable {
    var userId: Int
    var type: Int // 0: 추천, 1: 신고
}

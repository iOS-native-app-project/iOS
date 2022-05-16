//
//  UserGoodBadResponse.swift
//  jaksim_ios
//
//  Created by Acryl on 2022/05/16.
//

struct UserGoodBadResponse: Decodable {
    var success: Bool
    var statusCode: Int
    var data: UserGoodBadResult
}

struct UserGoodBadResult: Decodable {
    //var generatedMaps: []
    //var raw: []
    var affected: Int
}

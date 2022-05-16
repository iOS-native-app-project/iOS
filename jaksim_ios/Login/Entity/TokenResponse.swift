//
//  TokenResponse.swift
//  jaksim_ios
//
//  Created by Acryl on 2022/05/16.
//

struct TokenResponse: Decodable {
    var success: Bool
    var statusCode: Int
    var data: TokenResult?
}

struct TokenResult: Decodable {
    var tokenType: String
    var accessToken: String
    var refreshToken: String
}

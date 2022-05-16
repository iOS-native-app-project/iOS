//
//  NaverLoginResponse.swift
//  jaksim_ios
//
//  Created by 소영 on 2022/03/20.
//

struct LoginResponse: Decodable {
    var success: Bool
    var statusCode: Int
    var data: Result
}

struct Result: Decodable {
    var tokenType: StringLiteralType
    var accessToken: String
    var refreshToken: String
}

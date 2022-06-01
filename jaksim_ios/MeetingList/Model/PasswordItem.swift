//
//  PasswordItem.swift
//  jaksim_ios
//
//  Created by Apple on 2022/05/18.
//

import Foundation

struct PasswordResponseItem: Decodable {
    var success: Bool
    var statusCode: Int
    var data: Bool
}

struct PasswordRequestItem: Encodable {
    var password: String
}

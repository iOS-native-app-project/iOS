//
//  PasswordResponse.swift
//  jaksim_ios
//
//  Created by Apple on 2022/05/18.
//

import Foundation

struct PasswordResponse {
    var isOk: Bool
    
    init(_ item: PasswordResponseItem) {
        isOk = item.data
    }
}

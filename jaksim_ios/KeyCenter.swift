//
//  KeyCenter.swift
//  jaksim_ios
//
//  Created by Acryl on 2022/05/16.
//

import Alamofire

struct KeyCenter {
    static var LOGIN_TOKEN = ""
    static let HEADERS: HTTPHeaders = ["session": KeyCenter.LOGIN_TOKEN]
}

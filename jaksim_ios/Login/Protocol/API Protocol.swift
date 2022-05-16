//
//  API Protocol.swift
//  jaksim_ios
//
//  Created by Acryl on 2022/05/16.
//

protocol LoginDataManagerDelegate {
    func tokenRefresh(delegate: TokenRefreshDelegate)
}

protocol TokenRefreshDelegate {
    func successTokenRefresh(_ result: TokenResponse)
    func failedToResponse(message: String)
    func failedToRequest(message: String)
}

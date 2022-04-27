//
//  Notification.swift
//  jaksim_ios
//
//  Created by Apple on 2022/04/27.
//

import Foundation

struct Notification {
    
    var content: String
    var date: String
    var noti: Int
    
    init(_ item: NotificationItem) {
        self.content = item.content
        self.date = item.date
        self.noti = item.noti
    }

}

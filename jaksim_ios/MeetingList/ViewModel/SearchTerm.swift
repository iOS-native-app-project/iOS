//
//  SearchTerm.swift
//  jaksim_ios
//
//  Created by Apple on 2022/04/21.
//

import Foundation

struct SearchTerm {
    var name: String
    
    init(_ item: SearchTermItem) {
        name = item.name
    }
}

//
//  Season.swift
//  Landmarks
//
//  Created by Brian Sipple on 9/16/19.
//  Copyright © 2019 CypherPoet. All rights reserved.
//

import Foundation


enum Season: CaseIterable {
    case spring
    case summer
    case fall
    case winter
}


extension Season {
    
    var displayText: String {
        switch self {
        case .spring:
            return "🌷"
        case .summer:
            return "🌞"
        case .fall:
            return "🍁"
        case .winter:
            return "☃️"
        }
    }
}

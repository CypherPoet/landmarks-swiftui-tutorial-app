//
//  Profile.swift
//  Landmarks
//
//  Created by Brian Sipple on 9/16/19.
//  Copyright © 2019 CypherPoet. All rights reserved.
//

import Foundation


struct Profile {
    var username: String
    var prefersNotifications: Bool = true
    var seasonalPhoto: Season = .fall
    var goalDate: Date = Date()
    
    static var `default` = Profile(username: "CypherPoet")
}

//
//  Coordinates.swift
//  Landmarks
//
//  Created by Brian Sipple on 9/11/19.
//  Copyright © 2019 CypherPoet. All rights reserved.
//

import Foundation


struct Coordinates {
    var latitude: Double
    var longitude: Double
}

extension Coordinates: Decodable {}
extension Coordinates: Hashable {}


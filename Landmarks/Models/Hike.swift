//
//  Hike.swift
//  Landmarks
//
//  Created by Brian Sipple on 9/14/19.
//  Copyright © 2019 CypherPoet. All rights reserved.
//

import Foundation


struct Hike: Identifiable {
    let id: Int

    var name: String
    var distance: Double
    var difficulty: Int
    var observations: [Observation]
}

extension Hike: Codable {}
extension Hike: Hashable {}


// MARK: - Computeds
extension Hike {
    static var lengthFormatter = LengthFormatter()
    
    var distanceText: String {
        Hike.lengthFormatter.string(fromValue: distance, unit: .kilometer)
    }
}

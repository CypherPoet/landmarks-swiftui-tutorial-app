//
//  Landmark.swift
//  Landmarks
//
//  Created by Brian Sipple on 9/11/19.
//  Copyright © 2019 CypherPoet. All rights reserved.
//

import SwiftUI
import CoreLocation


struct Landmark: Identifiable {
    let id = UUID()
    
    var name: String
    var state: String
    var park: String
    var category: Category
    var isFavorite: Bool = false
    var isFeatured: Bool = false

    // TODO: Make this `fileprivate`
    var imageName: String
    // TODO: Make this `fileprivate`
    var coordinates: Coordinates
    
    
    // TODO: Remove this after implementing better ways to access stored data
    static let dummyLandmarks = [
        Landmark(
            name: "Turtle Rock 🐢",
            state: "California",
            park: "Joshua Tree National Park",
            category: .rivers,
            isFavorite: true,
            imageName: "turtlerock",
            coordinates: Coordinates(latitude: -116.166868, longitude: 34.011286)
        ),
        Landmark(
            name: "Silver Salmon Creek",
            state: "Alaska",
            park: "Lake Clark National Park and Preserve",
            category: .lakes,
            imageName: "silversalmoncreek",
            coordinates: Coordinates(latitude: -152.665167, longitude: 59.980167)
        )
    ]
}


// MARK: - Landmark.Category
extension Landmark {
    enum Category: String, CaseIterable, Codable, Hashable {
        case mountains
        case lakes
        case rivers
        
        var displayName: String {
            switch self {
            case .mountains:
                return "Mountains"
            case .lakes:
                return "Lakes"
            case .rivers:
                return "Rivers"
            }
        }
    }
}

// MARK: - Computeds
extension Landmark {
    var locationCoordinate: CLLocationCoordinate2D {
        .init(latitude: coordinates.latitude, longitude: coordinates.longitude)
    }
    
    var image: Image {
        ImageStore.shared.image(named: imageName)
    }
}

extension Landmark: Decodable {}
extension Landmark: Hashable {}

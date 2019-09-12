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

    // TODO: Make this `fileprivate`
    var imageName: String
    // TODO: Make this `fileprivate`
    var coordinates: Coordinates
}


// MARK: - Landmark.Category
extension Landmark {
    enum Category: String, CaseIterable, Codable, Hashable {
        case featured
        case lakes
        case rivers
        
        var displayName: String {
            switch self {
            case .featured:
                return "Featured"
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

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

    fileprivate var imageName: String
    fileprivate var coordinates: Coordinates
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
    
    var featuredImage: Image? {
        guard isFeatured else { return nil }
        
        return ImageStore.shared.image(named: "\(imageName)_featured")
    }
}

extension Landmark: Decodable {}
extension Landmark: Hashable {}

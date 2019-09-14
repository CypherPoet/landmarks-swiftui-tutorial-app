//
//  HikeDataStore.swift
//  Landmarks
//
//  Created by Brian Sipple on 9/14/19.
//  Copyright © 2019 CypherPoet. All rights reserved.
//

import SwiftUI
import Combine


final class HikeDataStore: ObservableObject {
    private static let savedHikes: [Hike] = DataLoader.loadModels(fromFileNamed: "hikeData.json")
    
    @Published var hikes: [Hike]
    
    
    init(hikes: [Hike] = HikeDataStore.savedHikes) {
        self.hikes = hikes
    }
}


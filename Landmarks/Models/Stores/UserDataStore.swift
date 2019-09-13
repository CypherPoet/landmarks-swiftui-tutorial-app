//
//  UserDataStore.swift
//  Landmarks
//
//  Created by Brian Sipple on 9/12/19.
//  Copyright © 2019 CypherPoet. All rights reserved.
//

import SwiftUI
import Combine


final class UserDataStore: ObservableObject {
    private static let savedLandmarks: [Landmark] = DataLoader.loadModels(fromFileNamed: "landmarkData.json")
    
    @Published var isShowingFavoritesOnly: Bool
    @Published var landmarks: [Landmark]
    
    
    init(
        isShowingFavoritesOnly: Bool = false,
        landmarks: [Landmark] = UserDataStore.savedLandmarks
        ) {
        self.isShowingFavoritesOnly = isShowingFavoritesOnly
        self.landmarks = landmarks
    }
}

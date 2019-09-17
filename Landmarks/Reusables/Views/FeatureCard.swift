//
//  FeatureCard.swift
//  Landmarks
//
//  Created by Brian Sipple on 9/17/19.
//  Copyright © 2019 CypherPoet. All rights reserved.
//

import SwiftUI

struct FeatureCard: View {
    let landmark: Landmark
    
    var body: some View {
        landmark.featuredImage?
            .resizable()
            .aspectRatio(3 / 2, contentMode: .fit)
            .overlay(LandmarkImageTextOverlay(landmark: landmark))
    }
}

struct FeatureCard_Previews: PreviewProvider {
    static var previews: some View {
        FeatureCard(landmark: LandmarksDataStore().landmarks[0])
    }
}

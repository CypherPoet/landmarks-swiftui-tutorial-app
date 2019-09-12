//
//  LandmarkRow.swift
//  Landmarks
//
//  Created by Brian Sipple on 9/11/19.
//  Copyright © 2019 CypherPoet. All rights reserved.
//

import SwiftUI

struct LandmarkRow: View {
    var landmark: Landmark
    
    var body: some View {
        HStack {
            Image(landmark.imageName)
                .resizable()
                .frame(width: 50, height: 50)
            Text(landmark.name)
            Spacer()
        }
    }
}


struct LandmarkRow_Previews: PreviewProvider {

    static let dummyLandmark = Landmark(
        name: "Turtle Rock 🐢",
        state: "California",
        park: "Joshua Tree National Park",
        category: .featured,
        imageName: "turtlerock",
        coordinates: Coordinates(latitude: -116.166868, longitude: 34.011286)
    )
    
    static var previews: some View {
        let landmark1 = Self.dummyLandmark
        
        var landmark2 = landmark1
        landmark2.name = "Eagle's Perch 🦅"
        
        return Group {
            LandmarkRow(landmark: landmark1)
            LandmarkRow(landmark: landmark2)
        }
        .previewLayout(.fixed(width: 300, height: 70))
        
        // 🔑 A view’s children inherit the view’s contextual settings,
        // such as preview configurations.
    }
}

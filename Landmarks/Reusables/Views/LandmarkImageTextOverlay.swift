//
//  LandmarkImageTextOverlay.swift
//  Landmarks
//
//  Created by Brian Sipple on 9/17/19.
//  Copyright © 2019 CypherPoet. All rights reserved.
//

import SwiftUI

struct LandmarkImageTextOverlay: View {
    let landmark: Landmark
    
    var gradient: LinearGradient {
        LinearGradient(
            gradient: Gradient(
                colors: [
                    Color.black.opacity(0.6),
                    Color.black.opacity(0)
                ]
            ),
            startPoint: .bottom,
            endPoint: .center
        )
    }
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Rectangle().fill(gradient)
            VStack(alignment: .leading) {
                Text(landmark.name)
                    .font(.title)
                    .fontWeight(.bold)
                
                Text(landmark.park)
            }
            .padding()
        }
        .foregroundColor(.white)
    }
}

struct LandmarkImageTextOverlay_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkImageTextOverlay(landmark: LandmarksDataStore().landmarks[0])
    }
}

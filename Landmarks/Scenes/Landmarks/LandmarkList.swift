//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Brian Sipple on 9/11/19.
//  Copyright © 2019 CypherPoet. All rights reserved.
//

import SwiftUI

struct LandmarkList: View {
    var landmarks: [Landmark]
    
    var body: some View {
        NavigationView {
            List(landmarks) { landmark in
                NavigationLink(destination: LandmarkDetail()) {
                    LandmarkRow(landmark: landmark)
                }
            }
            .navigationBarTitle("Landmarks")
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList(landmarks: Landmark.dummyLandmarks)
    }
}
//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Brian Sipple on 9/11/19.
//  Copyright © 2019 CypherPoet. All rights reserved.
//

import SwiftUI

struct LandmarkList: View {
    @EnvironmentObject var userData: LandmarksDataStore
    
    var body: some View {
        NavigationView {
            List {
                Toggle(isOn: $userData.isShowingFavoritesOnly) {
                    Text("Favorites only")
                }
                ForEach(landmarksToShow) { landmark in
                    NavigationLink(
                        destination: LandmarkDetail(landmark: landmark)
                            .environmentObject(self.userData)
                    ) {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            .navigationBarTitle("Landmarks")
        }
    }
}


// MARK: - Computeds
extension LandmarkList {
  
    var landmarksToShow: [Landmark] {
        userData.isShowingFavoritesOnly ?
            userData.landmarks.filter({ $0.isFavorite }) : userData.landmarks
    }
}


struct LandmarkList_Previews: PreviewProvider {
//    static let deviceNames = ["iPhone SE", "iPhone XR", "iPhone 11", "iPad Pro (12.9-inch)"]
    static let deviceNames = ["iPhone 11"]
    
    static var previews: some View {
        ForEach(
            Self.deviceNames,
            id: \.self,
            content: { deviceName in
                LandmarkList()
                    .environmentObject(LandmarksDataStore())
                    .previewDevice(PreviewDevice(rawValue: deviceName))
                    .previewDisplayName(deviceName)
            }
        )
    }
}

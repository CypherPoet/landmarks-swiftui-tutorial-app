//
//  LandmarkDetail.swift
//  Landmarks
//
//  Created by Brian Sipple on 9/10/19.
//  Copyright © 2019 CypherPoet. All rights reserved.
//

import SwiftUI

struct LandmarkDetail: View {
    @EnvironmentObject var userData: LandmarksDataStore
    
    let landmark: Landmark
    
    var body: some View {
        VStack {
            MapView(coordinate: landmark.locationCoordinate)
                .frame(height: 300)
                .edgesIgnoringSafeArea([.top])
            CircleImage(image: landmark.image)
                .offset(y: -180)
                .padding(.bottom, -180)
            descriptionView
            Spacer()
        }
        .navigationBarTitle(Text(landmark.name), displayMode: .inline)
    }
}


// MARK: - Computeds
extension LandmarkDetail {
    
    private var landmarkIndex: Int {
        userData.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }
}


extension LandmarkDetail {
    
    var descriptionView: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(verbatim: landmark.name)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.pink)
                    .multilineTextAlignment(.leading)
                
                Button(action: {
                    self.userData.landmarks[self.landmarkIndex].isFavorite.toggle()
                }) {
                    if self.userData.landmarks[self.landmarkIndex].isFavorite {
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                    } else {
                        Image(systemName: "star")
                            .foregroundColor(.gray)
                    }
                }
            }
            
            HStack {
                Text(verbatim: landmark.park)
                    .font(.subheadline)
                Spacer()
                Text(verbatim: landmark.state)
                    .font(.subheadline)
            }
        }
        .padding()
    }
}


struct LandmarkDetail_Previews: PreviewProvider {
    static var previews: some View {
        let userDataStore = LandmarksDataStore()
        
        return LandmarkDetail(landmark: userDataStore.landmarks[0])
            .environmentObject(userDataStore)
    }
}

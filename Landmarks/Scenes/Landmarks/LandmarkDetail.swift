//
//  LandmarkDetail.swift
//  Landmarks
//
//  Created by Brian Sipple on 9/10/19.
//  Copyright © 2019 CypherPoet. All rights reserved.
//

import SwiftUI

struct LandmarkDetail: View {
    var landmark: Landmark
    
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


extension LandmarkDetail {
    
    var descriptionView: some View {
        VStack(alignment: .leading) {
            Text(landmark.name)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.pink)
                .multilineTextAlignment(.leading)
            HStack {
                Text(landmark.park)
                    .font(.subheadline)
                Spacer()
                Text(landmark.state)
                    .font(.subheadline)
            }
        }
        .padding()
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkDetail(landmark: Landmark.dummyLandmarks[0])
    }
}

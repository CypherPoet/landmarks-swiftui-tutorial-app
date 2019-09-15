//
//  LandmarksCategoryItem.swift
//  Landmarks
//
//  Created by Brian Sipple on 9/15/19.
//  Copyright © 2019 CypherPoet. All rights reserved.
//

import SwiftUI

struct LandmarksCategoryItem: View {
    var landmark: Landmark
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            landmark.image
                .resizable()
                .frame(width: 155, height: 155)
                .cornerRadius(8)
            Text(verbatim: landmark.name)
                .font(.callout)
            
        }
        .padding(.leading, 15)
    }
}

struct LandmarksCategoryItem_Previews: PreviewProvider {
    static var previews: some View {
        LandmarksCategoryItem(landmark: LandmarksDataStore().landmarks[0])
    }
}

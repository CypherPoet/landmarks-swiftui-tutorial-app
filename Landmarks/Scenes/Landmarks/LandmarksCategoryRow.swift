//
//  LandmarksCategoryRow.swift
//  Landmarks
//
//  Created by Brian Sipple on 9/15/19.
//  Copyright © 2019 CypherPoet. All rights reserved.
//

import SwiftUI

struct LandmarksCategoryRow: View {
    let categoryName: String
    let landmarks: [Landmark]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(verbatim: categoryName)
                .font(.headline)
                .fontWeight(.semibold)
                .padding(15)
                .padding(.top, 5)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(landmarks) { landmark in
                        Text(verbatim: landmark.name)
                    }
                }
            }
            .frame(height: 185)
        }
    }
}


struct LandmarksCategoryRow_Previews: PreviewProvider {
    static var previews: some View {
        return LandmarksCategoryRow(
            categoryName: "Category Name",
            landmarks: LandmarksDataStore().landmarks
            
            // Use `.constant` if passing as a binding ---> https://stackoverflow.com/a/57186958
            //            landmarks: .constant(LandmarksDataStore().landmarks)
        )
    }
}

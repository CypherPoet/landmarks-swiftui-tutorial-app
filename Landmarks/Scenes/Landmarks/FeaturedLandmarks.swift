//
//  FeaturedLandmarks.swift
//  Landmarks
//
//  Created by Brian Sipple on 9/15/19.
//  Copyright © 2019 CypherPoet. All rights reserved.
//

import SwiftUI

struct FeaturedLandmarks: View {
    let landmarks: [Landmark]
    
    
    var body: some View {
        landmarks[0].image
            .resizable()
    }
}

//struct FeaturedLandmarks_Previews: PreviewProvider {
//    static var previews: some View {
//        FeaturedLandmarks()
//    }
//}

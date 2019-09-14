//
//  GraphCapsule.swift
//  Landmarks
//
//  Created by Brian Sipple on 9/14/19.
//  Copyright © 2019 CypherPoet. All rights reserved.
//

import SwiftUI

struct GraphCapsule: View {
    var index: Int
    var height: CGFloat
    var range: Range<Double>
    var overallRange: Range<Double>
    
    
    var body: some View {
        Capsule()
            .fill(Color.white)
            .frame(height: height * heightRatio, alignment: .bottom)
            .offset(x: 0, y: height * -offsetRatio)
    }
}


// MARK: - Computeds
extension GraphCapsule {
    var heightRatio: CGFloat {
        max(CGFloat(range.magnitude / overallRange.magnitude), 0.15)
    }
    
    var offsetRatio: CGFloat {
        CGFloat(
            (range.lowerBound - overallRange.lowerBound) / overallRange.magnitude
        )
    }
}



struct GraphCapsule_Previews: PreviewProvider {
    static var previews: some View {
        GraphCapsule(
            index: 0,
            height: 200,
            range: 13 ..< 42,
            overallRange: 2 ..< 98
        )
        .shadow(color: .purple, radius: 12, x: 0, y: 0)
    }
}

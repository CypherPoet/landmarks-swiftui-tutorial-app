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
            .animation(animation)
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
    
    var animation: Animation {
        Animation.spring(dampingFraction: 0.5)
            .speed(2)
            .delay(Double(index) * 0.03)
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

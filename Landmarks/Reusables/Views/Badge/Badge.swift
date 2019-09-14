//
//  Badge.swift
//  Landmarks
//
//  Created by Brian Sipple on 9/13/19.
//  Copyright © 2019 CypherPoet. All rights reserved.
//

import SwiftUI

struct Badge: View {
    let rotationAngle = Angle(radians: .pi / 4)
    
    var badgeSymbols: some View {
        ForEach(rotationAngles, id: \.self) { angle in
            RotatedBadgeSymbol(angle: angle)
                .opacity(0.5)
        }
    }
    
    var body: some View {
        ZStack {
            BadgeBackground()
            
            GeometryReader { geometry in
                self.badgeSymbols
                    .scaleEffect(0.25, anchor: .top)
                    .position(x: geometry.size.width / 2, y: 0.75 * geometry.size.height)
            }
        }.scaledToFit()
    }
}


extension Badge {
    var numberOfRotations: Int {
        Int(ceil((2.0 * .pi) / rotationAngle.radians))
    }
    
    
    var rotationAngles: [Angle] {
        (0 ... numberOfRotations).map { Angle(radians: Double($0) * rotationAngle.radians) }
    }
}

struct Badge_Previews: PreviewProvider {
    static var previews: some View {
        Badge()
    }
}

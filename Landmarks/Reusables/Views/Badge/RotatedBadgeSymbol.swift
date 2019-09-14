//
//  RotatedBadgeSymbol.swift
//  Landmarks
//
//  Created by Brian Sipple on 9/13/19.
//  Copyright © 2019 CypherPoet. All rights reserved.
//

import SwiftUI

struct RotatedBadgeSymbol: View {
    let angle: Angle
    
    var body: some View {
        BadgeSymbol()
            .padding(-60)
            .rotationEffect(angle, anchor: .bottom)
    }
}



struct RotatedBadgeSymbol_Previews: PreviewProvider {
    static var previews: some View {
//        RotatedBadgeSymbol(angle: Angle(radians: .pi / 4))
        RotatedBadgeSymbol(angle: Angle(radians: 0))
    }
}

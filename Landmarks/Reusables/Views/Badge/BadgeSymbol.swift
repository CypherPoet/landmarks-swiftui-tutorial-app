//
//  BadgeSymbol.swift
//  Landmarks
//
//  Created by Brian Sipple on 9/13/19.
//  Copyright © 2019 CypherPoet. All rights reserved.
//

import SwiftUI

struct BadgeSymbol: View {
    var body: some View {
        topPeak
    }
}


// MARK: - Top Peak
extension BadgeSymbol {
    
    var topPeak: some View {
        GeometryReader { geometry in
            Path { path in
                let width = min(geometry.size.width, geometry.size.height)
                let height = width * 0.75

                let outerSpacing = width * 0.05
                let innerSpacing = outerSpacing

                let midX = width * 0.5
                
                let topWidth = width * 0.452
                let topHeight = height * 0.488
                
                let topPeakStartPoint = CGPoint(x: midX, y: outerSpacing)
                let baseStartPoint = CGPoint(x: midX, y: (topHeight * 0.5) + topPeakStartPoint.y + innerSpacing)

                // Top Peak
                path.addLines([
                    topPeakStartPoint,
                    CGPoint(x: topPeakStartPoint.x - (topWidth * 0.5), y: topHeight - topPeakStartPoint.y),
                    CGPoint(x: topPeakStartPoint.x, y: (topHeight * 0.5) + topPeakStartPoint.y),
                    CGPoint(x: topPeakStartPoint.x + (topWidth * 0.5), y: topHeight - topPeakStartPoint.y),
                    topPeakStartPoint
                ])
                
                path.move(to: baseStartPoint)
                
                // Bottom Base
                path.addLines([
                    CGPoint(
                        x: baseStartPoint.x - (topWidth * 0.5),
                        y: baseStartPoint.y + (innerSpacing * 1.55)
                    ),
                    CGPoint(x: outerSpacing, y: height - outerSpacing),
                    CGPoint(x: width - outerSpacing, y: height - outerSpacing),
                    CGPoint(
                        x: baseStartPoint.x + (topWidth * 0.5),
                        y: baseStartPoint.y + (innerSpacing * 1.55)
                    ),
                    baseStartPoint
                ])
            }
            .fill(Color("Mountain Base"))
        }
    }
}


struct BadgeSymbol_Previews: PreviewProvider {
    static var previews: some View {
        BadgeSymbol()
    }
}

//
//  BadgeBackground.swift
//  Landmarks
//
//  Created by Brian Sipple on 9/13/19.
//  Copyright © 2019 CypherPoet. All rights reserved.
//

import SwiftUI

struct BadgeBackground: View {
    static let gradientStart = Color(hue: 0.88, saturation: 0.46, brightness: 0.94)
    static let gradientEnd = Color(hue: 0.07, saturation: 0.50, brightness: 0.94)
    static let xScale: CGFloat = 0.832
    
    var body: some View {
        GeometryReader { geometry in
            Path { path in
                
                // 🔑 Using the smallest of the geometry’s
                // two dimensions preserves the aspect ratio
                // of the badge when its containing view isn’t square.
                let sideLength = min(geometry.size.width, geometry.size.height)
                
                var height = sideLength

                var width = sideLength
                let xOffset = (width * (1.0 - Self.xScale)) / 2.0
                
                width *= Self.xScale
//                height *= Self.xScale
                
                path.move(
                    to: CGPoint(
                        x: xOffset + (width * 0.95),
                        y: height * (0.20 + HexagonParameters.adjustment)
                    )
                )
                
                HexagonParameters.points.forEach { point in
                    path.addLine(
                        to: CGPoint(
                            x: xOffset + width * point.useWidth.0 * point.xFactors.0,
                            y: height * point.useHeight.0 * point.yFactors.0
                        )
                    )
                    
                    path.addQuadCurve(
                        to: CGPoint(
                            x: xOffset + width * point.useWidth.1 * point.xFactors.1,
                            y: height * point.useHeight.1 * point.yFactors.1
                        ),
                        control: CGPoint(
                            x: xOffset + width * point.useWidth.2 * point.xFactors.2,
                            y: height * point.useHeight.2 * point.yFactors.2
                        )
                    )
                }
            }
            .fill(
                LinearGradient(
                    gradient: Gradient(colors: [Self.gradientStart, Self.gradientEnd]),
                    startPoint: UnitPoint(x: 0.5, y: 0.0),
                    endPoint: UnitPoint(x: 0.5, y: 0.6)
                )
            )
            .aspectRatio(1, contentMode: .fit)
        }
    }
}


struct BadgeBackground_Previews: PreviewProvider {
    static var previews: some View {
        BadgeBackground()
    }
}

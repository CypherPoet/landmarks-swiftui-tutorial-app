//
//  HikeGraph.swift
//  Landmarks
//
//  Created by Brian Sipple on 9/14/19.
//  Copyright © 2019 CypherPoet. All rights reserved.
//

import SwiftUI

func rangeOfRanges<C: Collection>(_ ranges: C) -> Range<Double>
    where C.Element == Range<Double>
{
    guard !ranges.isEmpty else { return 0 ..< 0 }
    
    let low = ranges.lazy.map { $0.lowerBound }.min()!
    let high = ranges.lazy.map { $0.upperBound }.max()!
    
    return low ..< high
}


struct HikeGraph: View {
    var hike: Hike
    var observationKeyPath: KeyPath<Hike.Observation, Range<Double>>
    
    var capsuleColor: Color {
        switch observationKeyPath {
        case \.elevation:
            return .red
        case \.heartRate:
            return .blue
        case \.pace:
            return .pink
        default:
            return .black
        }
    }
    
    var body: some View {
        let observations = hike.observations
        let overallRange = rangeOfRanges(observations.lazy.map { $0[keyPath: self.observationKeyPath] })

        let maxObservationMagnitude = observations.map { observation in
            observation[keyPath: self.observationKeyPath].magnitude
        }.max() ?? 0
        
        let barsHeightRatio = 1 - CGFloat(maxObservationMagnitude / overallRange.magnitude)

        
        return GeometryReader { geometry in
            HStack(alignment: .bottom, spacing: geometry.size.width / 120) {
                ForEach(observations.indices) { index in
                    GraphCapsule(
                        index: index,
                        containerHeight: geometry.size.height,
                        observationSetRange: observations[index][keyPath: self.observationKeyPath],
                        overallRange: overallRange
                    )
                    .colorMultiply(self.capsuleColor)
                }
                .offset(x: 0, y: geometry.size.height * barsHeightRatio)
            }
        }
    }
}




struct HikeGraph_Previews: PreviewProvider {
    static var previews: some View {
        let hikes = HikeDataStore().hikes
        
        return Group {
            HikeGraph(hike: hikes[0], observationKeyPath: \.elevation)
                .frame(height: 200)
            HikeGraph(hike: hikes[0], observationKeyPath: \.heartRate)
                .frame(height: 200)
            HikeGraph(hike: hikes[0], observationKeyPath: \.pace)
                .frame(height: 200)
        }
    }
}

//
//  HikeDetail.swift
//  Landmarks
//
//  Created by Brian Sipple on 9/14/19.
//  Copyright © 2019 CypherPoet. All rights reserved.
//

import SwiftUI

struct HikeDetail: View {
    let hike: Hike
    
    @State var dataToShow = \Hike.Observation.elevation
    
    var observationButtons = [
        ("Elevation", \Hike.Observation.elevation),
        ("Heart Rate", \Hike.Observation.heartRate),
        ("Pace", \Hike.Observation.pace),
    ]
    

    var body: some View {
        VStack {
            HikeGraph(hike: hike, observationKeyPath: dataToShow)
                .frame(height: 200, alignment: .center)
            
            HStack(spacing: 25) {
                ForEach(observationButtons, id: \.0) { (label, observation) in
                    Button(action: {
                        self.dataToShow = observation
                    }) {
                        Text(label)
                            .font(.system(Font.TextStyle.caption))
                            .foregroundColor(
                                observation == self.dataToShow
                                    ? Color.gray
                                    : Color.accentColor
                            )
                            .animation(nil)
                    }
                }
            }
        }
    }
}


struct HikeDetail_Previews: PreviewProvider {
    static var previews: some View {
        let hike = HikeDataStore().hikes[0]
        
        return HikeDetail(hike: hike)
    }
}

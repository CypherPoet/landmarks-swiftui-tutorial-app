//
//  HikeView.swift
//  Landmarks
//
//  Created by Brian Sipple on 9/14/19.
//  Copyright © 2019 CypherPoet. All rights reserved.
//

import SwiftUI

struct HikeView: View {
    var hike: Hike
    
    @State private var isShowingDetail = false
    
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text(verbatim: "Hike name")
                        .font(.headline)
                    Text(verbatim: "Hike distance")
                }

                Spacer()
                
                Button(action: {
                    self.isShowingDetail.toggle()
                }) {
                    Image(systemName: "chevron.right.circle")
                        .rotationEffect(.radians(isShowingDetail ? (.pi / 2) : 0))
                        .padding()
                        .animation(.easeInOut)
                }
            }
            
            
            if isShowingDetail {
                // Render Detail View
                HikeDetail(hike: hike)
            }
        }
    }
}

struct HikeView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            HikeView(hike: HikeDataStore().hikes[0])
                .padding()
            Spacer()
        }
    }
}

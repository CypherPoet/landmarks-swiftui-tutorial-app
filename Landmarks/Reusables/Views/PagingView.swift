//
//  PagingView.swift
//  Landmarks
//
//  Created by Brian Sipple on 9/17/19.
//  Copyright © 2019 CypherPoet. All rights reserved.
//

import SwiftUI

struct PagingView<Page: View>: View {
    var viewControllers: [UIHostingController<Page>]
    @State private var currentPage = 0
    
    
    init(_ views: [Page]) {
        self.viewControllers = views.map { UIHostingController(rootView: $0) }
    }
    
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            PageViewController(controllers: viewControllers, currentPage: $currentPage)
            PageControl(numberOfPages: viewControllers.count, currentPage: $currentPage)
                .padding(.trailing)
        }
        .frame(maxHeight: 280, alignment: .center)
    }
}


struct PageView_Previews: PreviewProvider {
    
    static var previews: some View {
        let featuredLandmarks = LandmarksDataStore().landmarks.filter { $0.isFeatured }
        let featureCards = featuredLandmarks.map { FeatureCard(landmark: $0) }
        
        return PagingView(featureCards)
    }
}

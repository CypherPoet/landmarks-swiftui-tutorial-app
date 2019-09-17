//
//  PageView.swift
//  Landmarks
//
//  Created by Brian Sipple on 9/17/19.
//  Copyright © 2019 CypherPoet. All rights reserved.
//

import SwiftUI

struct PageView<Page: View>: View {
    var viewControllers: [UIHostingController<Page>]
    
    init(_ views: [Page]) {
        self.viewControllers = views.map { UIHostingController(rootView: $0) }
    }
    
    var body: some View {
        PageViewController(controllers: viewControllers)
    }
    
}


struct PageView_Previews: PreviewProvider {
    
    static var previews: some View {
        let featuredLandmarks = LandmarksDataStore().landmarks.filter { $0.isFeatured }
        let featureCards = featuredLandmarks.map { FeatureCard(landmark: $0) }
        
        return PageView(featureCards)
    }
}

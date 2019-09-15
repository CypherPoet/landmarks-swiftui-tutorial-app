//
//  CategoryHome.swift
//  Landmarks
//
//  Created by Brian Sipple on 9/15/19.
//  Copyright © 2019 CypherPoet. All rights reserved.
//

import SwiftUI

struct CategoryHome: View {
    @EnvironmentObject private var landmarksDataStore: LandmarksDataStore

    
    var body: some View {
        NavigationView {
            List {
                ForEach(categories.keys.sorted(), id: \.self) { categoryName in
                    Text(verbatim: categoryName)
                }
            }
            .navigationBarTitle(Text("Featured"))
        }
    }
}


extension CategoryHome {
    var landmarks: [Landmark] { landmarksDataStore.landmarks }
    
    var categories: [String: [Landmark]] {
        Dictionary(grouping: landmarks, by: { $0.category.displayName })
    }
}


struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
            .environmentObject(LandmarksDataStore())
    }
}

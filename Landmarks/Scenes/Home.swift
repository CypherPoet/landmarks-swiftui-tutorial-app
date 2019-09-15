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

    @State private var isShowingProfile = false
    
    
    var body: some View {
        NavigationView {
            List {
                FeaturedLandmarks(landmarks: featuredLandmarks)
                    .scaledToFill()
                    .frame(height: 200)
                    .clipped()
                    .listRowInsets(EdgeInsets())
                
                ForEach(categories.keys.sorted(), id: \.self) { categoryName in
                    LandmarksCategoryRow(
                        categoryName: categoryName,
                        landmarks: self.categories[categoryName]!
                    )
                }
                .listRowInsets(EdgeInsets())
                
                NavigationLink(destination: LandmarkList()) {
                    Text(verbatim: "See All Landmarks")
                }
            }
            .navigationBarTitle(Text("Featured"))
            .navigationBarItems(trailing: profileButton)
            .sheet(isPresented: $isShowingProfile) {
                Text("User Profile")
            }
        }
    }
}


// MARK: - Computeds
extension CategoryHome {
    var landmarks: [Landmark] { landmarksDataStore.landmarks }

    var categories: [String: [Landmark]] {
        Dictionary(grouping: landmarks, by: { $0.category.displayName })
    }
    
    var featuredLandmarks: [Landmark] { landmarks.filter { $0.isFeatured } }
}


// MARK: - Helper Views
extension CategoryHome {
    
    private var profileButton: some View {
        Button(action: {
            self.isShowingProfile.toggle()
        }) {
            Image(systemName: "person.crop.circle")
                .imageScale(.large)
                .accessibility(label: Text("User Profile"))
                .padding()
        }
    }
}


struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
            .environmentObject(LandmarksDataStore())
    }
}

//
//  ProfileSummary.swift
//  Landmarks
//
//  Created by Brian Sipple on 9/16/19.
//  Copyright © 2019 CypherPoet. All rights reserved.
//

import SwiftUI

struct ProfileSummary: View {
    let profile: Profile
    let hikes: [Hike]

    static let goalDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.timeStyle = .none
        formatter.dateStyle = .medium
        
        return formatter
    }()
    
   
    let badgeTitles = [
        "First Everest Climb",
        "10 Everest Climbs",
        "Found Atlantis",
        "Saved the Rainforest",
        "Discovered Treasure",
        "Northern Lights",
    ]
    

    var body: some View {
        List {
            Text(profile.username)
                .font(.title)
                .fontWeight(.bold)
            
            Text("Notifications: \(profile.prefersNotifications ? "On" : "Off")")
            Text("Seasonal Photos: \(profile.seasonalPhoto.displayText)")
            Text("Goal Date: \(profile.goalDate, formatter: Self.goalDateFormatter)")
            
            VStack(alignment: .leading) {
                Text("Badges Earned")
                    .font(.headline)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 16) {
                        ForEach(0 ..< badgeTitles.count) { titleIndex in
                            HikeBadge(name: self.badgeTitles[titleIndex])
                                .hueRotation(.radians((.pi / 4) * Double(titleIndex)))
                        }
                    }
                }
            }
            
            VStack(alignment: .leading) {
                Text("Latest Hike")
                    .font(.headline)
                
                HikeView(hike: hikes[0])
            }
        }
        
    }
}

struct ProfileSummary_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSummary(
            profile: .default,
            hikes: HikeDataStore().hikes
        )
    }
}

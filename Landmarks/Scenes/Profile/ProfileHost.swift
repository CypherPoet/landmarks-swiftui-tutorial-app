//
//  ProfileHost.swift
//  Landmarks
//
//  Created by Brian Sipple on 9/15/19.
//  Copyright © 2019 CypherPoet. All rights reserved.
//

import SwiftUI

struct ProfileHost: View {
    @Environment(\.editMode) var editMode
    
    @State private var draftProfile = Profile.default
    
    @State private var profile = Profile.default
    @State private var hikes = HikeDataStore().hikes

    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                Spacer()
                EditButton()
            }
    
            if editMode?.wrappedValue == .inactive {
                ProfileSummary(profile: profile, hikes: hikes)
            } else {
                Text("EDit")
            }
        }
        .padding()
    }
}



struct ProfileHost_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHost()
    }
}


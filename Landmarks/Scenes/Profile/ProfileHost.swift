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
                if editMode?.wrappedValue == .active {
                    Button(action: {
                        // Make sure we clear out the values the user chooses to
                        // discard when they tap the Cancel button.
                        self.draftProfile = self.profile
                        self.editMode?.animation().wrappedValue = .inactive
                    }) {
                        Text("Cancel")
                    }
                }
                
                Spacer()
                EditButton()
            }
            
            if editMode?.wrappedValue == .inactive {
                ProfileSummary(profile: profile, hikes: hikes)
            } else {
                ProfileEditor(profile: $draftProfile)
                    .onDisappear {
                        self.profile = self.draftProfile
                    }
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


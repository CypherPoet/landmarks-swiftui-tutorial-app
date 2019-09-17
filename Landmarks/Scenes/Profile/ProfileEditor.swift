//
//  ProfileEditor.swift
//  Landmarks
//
//  Created by Brian Sipple on 9/16/19.
//  Copyright © 2019 CypherPoet. All rights reserved.
//

import SwiftUI

struct ProfileEditor: View {
    @Binding var profile: Profile
    
    var body: some View {
        List {
            HStack {
                Text("Username")
                    .fontWeight(.bold)
                Divider()
                TextField("Username", text: $profile.username)
            }
            
            Toggle(isOn: $profile.prefersNotifications) {
                Text("Enable Notifications")
            }
            
            VStack(alignment: .leading, spacing: 20) {
                Text("Preferred Season")
                    .fontWeight(.bold)
                
                Picker("Seasonal Photo", selection: $profile.seasonalPhoto) {
                    ForEach(Season.allCases, id: \.self) { season in
                        Text(season.displayText)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            .padding(.top)
            
            VStack(alignment: .leading, spacing: 12) {
                Text("Goal Date")
                    .fontWeight(.bold)
  
                DatePicker(
                    "Goal Date",
                    selection: $profile.goalDate,
                    in: goalDateRange,
                    displayedComponents: .date
                )
                .labelsHidden()
                
            }
            .padding(.top)
        }
    }
}


// MARK: - Computeds
extension ProfileEditor {
    var minGoalDate: Date { Date() }

    var maxGoalDate: Date {
        Calendar.current.date(byAdding: .year, value: 1000, to: minGoalDate) ?? Date()
    }
    
//    var goalDateRange: ClosedRange<Date> { minGoalDate ... maxGoalDate }
    var goalDateRange: PartialRangeFrom<Date> { minGoalDate... }
}


struct ProfileEditor_Previews: PreviewProvider {
    static var previews: some View {
        ProfileEditor(profile: .constant(.default))
    }
}

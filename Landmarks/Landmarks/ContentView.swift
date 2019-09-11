//
//  ContentView.swift
//  Landmarks
//
//  Created by Brian Sipple on 9/10/19.
//  Copyright © 2019 CypherPoet. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Turtle Rock")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.pink)
                .multilineTextAlignment(.leading)
            Text("Joshua Tree National Park")
                .font(.subheadline)
        }        
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

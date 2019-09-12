//
//  MapView.swift
//  Landmarks
//
//  Created by Brian Sipple on 9/11/19.
//  Copyright © 2019 CypherPoet. All rights reserved.
//

import SwiftUI
import MapKit


struct MapView: View {
    var coordinate: CLLocationCoordinate2D
}


extension MapView: UIViewRepresentable {
    typealias UIViewType = MKMapView
    
    func makeUIView(context: UIViewRepresentableContext<MapView>) -> MKMapView {
        MKMapView(frame: .zero)
    }
    
    
    func updateUIView(_ mapView: MKMapView, context: UIViewRepresentableContext<MapView>) {
        let span = MKCoordinateSpan(latitudeDelta: 2.0, longitudeDelta: 2.0)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        
        mapView.setRegion(region, animated: true)
    }
}


struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(
            coordinate: CLLocationCoordinate2D(
                latitude: 34.011286,
                longitude: -116.166868
            )
        )
    }
}

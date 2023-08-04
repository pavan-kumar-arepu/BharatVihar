//
//  Maps.swift
//  BharatVihar
//
//  Created by Pavankumar Arepu on 03/08/23.
//

import Foundation
import MapKit
import SwiftUI

struct MapView: View {
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 20.5937, longitude: 78.9629), // India's approximate center
        span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10) // Zoom level
    )

    var body: some View {
        Map(coordinateRegion: $region)
            .edgesIgnoringSafeArea(.all)
    }
}

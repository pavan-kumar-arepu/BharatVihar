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
        center: CLLocationCoordinate2D(latitude: 20.5937, longitude: 78.9629),
        span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10)
    )
    
    let buttons = ["States", "Attractions", "Capital", "Temples"]

    var body: some View {
        VStack(spacing: 0) {
            Text("Explore India from Map")
                .font(.title)
                .padding(.top, 20)
            
            ZStack(alignment: .topLeading) {
                Map(coordinateRegion: $region)
                    .edgesIgnoringSafeArea(.all)
                    .cornerRadius(30)
                    .shadow(radius: 10)
                    .padding(.horizontal, 20)
                    .padding(.bottom, 20)
                    .padding(.top, 20)
                
                HStack(spacing: 20) {
                    VStack {
                        Button(action: {
                            // Handle the action for the button
                        }) {
                            Text("States")
                                .foregroundColor(Color.white)
                                .padding(.vertical, 10)
                                .padding(.horizontal, 20)
                                .background(Color.blue)
                                .cornerRadius(20)
                                .shadow(radius: 10)
                        }
                        Spacer()
                    }
                    
                    Spacer()
                    
                    VStack {
                        Spacer()
                        Button(action: {
                            // Handle the action for the button
                        }) {
                            Text("Attractions")
                                .foregroundColor(Color.white)
                                .padding(.vertical, 10)
                                .padding(.horizontal, 20)
                                .background(Color.blue)
                                .cornerRadius(20)
                                .shadow(radius: 10)
                        }
                    }
                }
                .padding(.horizontal, 20)
            }
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}

//
//  IndiaMap.swift
//  BharatVihar
//
//  Created by Pavankumar Arepu on 03/08/23.
//

import Foundation
import MapKit
import SwiftUI

struct IndiaMap: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("India Map using Apple Maps")
                MapView()
                    .edgesIgnoringSafeArea(.all) // Make the map view fullscreen
            }
            .navigationBarTitle("Map Example")
        }
    }
}

struct IndiaMapAnimation: View {
    @State private var showFullMap = false

    var body: some View {
        VStack {
            if !showFullMap {
                SmallGlobeIconView()
                    .onTapGesture {
                        withAnimation {
                            toggleMapVisibility()
                        }
                    }
            }
            if showFullMap {
                IndiaMapFullView()
            }
        }
    }

    private func toggleMapVisibility() {
        showFullMap.toggle()
    }
}



struct SmallGlobeIconView: View {

    var body: some View {
        Image(systemName: "globe")
            .imageScale(.large)
            .foregroundColor(.accentColor)
    }
}

struct IndiaMapFullView: View {
    var body: some View {
        MapView() // Your full map view
            .edgesIgnoringSafeArea(.all)
    }
}
struct IndiaMap_Preview: PreviewProvider {
    static var previews: some View {
        IndiaMapAnimation()
    }
}


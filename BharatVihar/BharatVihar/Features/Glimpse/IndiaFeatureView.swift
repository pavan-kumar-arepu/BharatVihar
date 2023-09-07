//
//  IndiaFeatureView.swift
//  BharatVihar
//
//  Created by Pavankumar Arepu on 03/09/23.
//

import Foundation

import SwiftUI
import CoreMotion
import SpriteKit

class MotionManager: ObservableObject {
    let motionManager = CMMotionManager()
    @Published var x = 0.0
    @Published var y = 0.0
    
    init() {
        motionManager.startDeviceMotionUpdates(to: .main) { [weak self] data, error in
            
            guard let motion = data?.attitude else { return }
            self?.x = motion.roll
            self?.y = motion.pitch
        }
    }
}


import SwiftUI

struct IndiaFeaturesView: View {
    
    @StateObject private var motion = MotionManager()
    @State private var isCultureTapped = false
    @State private var isGovernmentTapped = false
    @State private var isInformationTapped = false
    @State private var isMoreTapped = false
    
    var body: some View {
        ZStack {
            // Your existing background
            // ...
            
            LinearGradient(
                gradient: Gradient(colors: [.green, .white, .green]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea(.all)
            
            GeometryReader { geo in
                Image("india2")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                    .aspectRatio(1, contentMode: .fit)
            }
            .offset(x: CGFloat(motion.x * Double(50)), y: CGFloat(motion.y * 50))
            .offset(y: 120)
            
            // Circular Buttons
            VStack {
                HStack {
                    Button(action: {
                        isInformationTapped.toggle()
                    }) {
                        Image(systemName: "info.circle.fill")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.green)
                            .clipShape(Circle())
                            .padding()
                    }
                    Spacer(); Spacer(); Spacer(); Spacer()
                    Button(action: {
                        isMoreTapped.toggle()
                    }) {
                        Image(systemName: "ellipsis.circle.fill")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.purple)
                            .clipShape(Circle())
                            .padding()
                    }
                }
                
                Spacer()
                HStack {
                    Button(action: {
                        isCultureTapped.toggle()
                    }) {
                        Image(systemName: "paintpalette.fill")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.blue)
                            .clipShape(Circle())
                            .padding()
                    }
                    Spacer(); Spacer(); Spacer(); Spacer()
                    
                    HStack {
                        Button(action: {
                            isGovernmentTapped.toggle()
                        }) {
                            Image(systemName: "flag.fill")
                                .font(.largeTitle)
                                .foregroundColor(.white)
                                .padding()
                                .background(Color.red)
                                .clipShape(Circle())
                                .padding()
                        }
                    }
                }
            }
            .offset(y: 30)
            
            // Feature List Views
            if isCultureTapped {
                CultureFeatureListView(position: CGPoint(x: 220, y: 600))
            } else if isGovernmentTapped {
                GovernmentFeatureListView(position: CGPoint(x: 200, y: 600))
            } else if isInformationTapped {
                InformationFeatureListView(position: CGPoint(x: 220, y: 200))
            } else if isMoreTapped {
                MoreFeatureListView(position: CGPoint(x: 200, y: 200))
            }
        }
    }
}


struct CultureFeatureListView: View {
    var position: CGPoint // Receive the position from the parent view

    var body: some View {
        List {
            Text("Culture")
            Text("Attractions")
            Text("Languages")
        }
        .frame(width: 300, height: 200)
        .background(Color.white)
        .cornerRadius(8)
        .shadow(radius: 4)
        .position(position) // Adjust the position as needed
    }
}

struct GovernmentFeatureListView: View {
    var position: CGPoint // Receive the position from the parent view

    var body: some View {
        List {
            Text("Services")
            Text("Minister")
            Text("Awards")
        }
        .frame(width: 300, height: 200)
        .background(Color.white)
        .cornerRadius(8)
        .shadow(radius: 4)
        .position(position) // Adjust the position as needed
    }
}

struct InformationFeatureListView: View {
    var position: CGPoint // Receive the position from the parent view

    var body: some View {
        List {
            Text("Timeline")
            Text("HotNews")
            Text("AskAnyThing")
        }
        .frame(width: 300, height: 200)
        .background(Color.white)
        .cornerRadius(8)
        .shadow(radius: 4)
        .position(position) // Adjust the position as needed
    }
}

struct MoreFeatureListView: View {
    var position: CGPoint
    var body: some View {
        List {
            Text("WomenPower")
            Text("MagicNumbers")
            Text("FlagHoisting")
        }
        .frame(width: 300, height: 200)
        .background(Color.white)
        .cornerRadius(8)
        .shadow(radius: 4)
        .position(position) // Adjust the position as needed
    }
}

// Define GovernmentFeatureListView, InformationFeatureListView, and MoreFeatureListView similarly


struct IndiaFeaturesView_Previews: PreviewProvider {
    static var previews: some View {
        IndiaFeaturesView()
    }
}

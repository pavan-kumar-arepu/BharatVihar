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

struct IndiaFeaturesView : View {

    @StateObject private var motion = MotionManager()
    @State private var xOffset: CGFloat = 20

    var body: some View {
        ZStack {
            
            LinearGradient(
                gradient: Gradient(colors: [.green, .white, .green]), // Replace with your desired colors
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea(.all)
            
//            SpriteView(scene: scene, options: [.allowsTransparency])
                        
            GeometryReader { geo in
                Image("india2") // Replace with your foreground image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                    .offset(x: xOffset)
                    .aspectRatio(1, contentMode: .fit)
            }
            .offset(x: CGFloat(motion.x * Double(50)), y: CGFloat(motion.y * 50))
            .offset(y: 120)
        }
    }
}



struct IndiaFeaturesView_Previews: PreviewProvider {
    static var previews: some View {
        IndiaFeaturesView()
    }
}

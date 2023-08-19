//
//  CommonFeatureDetailView.swift
//  BharatVihar
//
//  Created by Pavankumar Arepu on 13/08/23.
//

import Foundation
import SwiftUI

struct AnyViewFeatureDetailView: View {
    let featureData: [CommonFeature] // An array of feature data
    
    var body: some View {
        GenericFeatureDetailView(featureData: featureData) // Creating view here
    }
}

struct GenericFeatureDetailView: View {
    let featureData: [CommonFeature] // An array of feature data
    
    var body: some View {

        TabView {
            ForEach(featureData) { feature in
                FeatureDetailPage(feature: feature)
            }
        }
        .tabViewStyle(PageTabViewStyle())
    }
}

import SwiftUI


struct FeatureDetailPage: View {
    let feature: CommonFeature // A single feature data
    
    var body: some View {
        VStack {
            if let imageUrl = feature.image {
                // Load the image directly here
                RemoteImage(url: imageUrl)
                    .aspectRatio(contentMode: .fit)
                    .frame(height: UIScreen.main.bounds.height * 0.3)
                    .padding(.horizontal, 20)
            } else {
                Image("Heritage-Bg") // Placeholder image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: UIScreen.main.bounds.height * 0.3)
                    .padding(.horizontal, 20)
            }
            
            Text(feature.title)
                .font(.title)
                .fontWeight(.bold)
                .padding(.top, 10)
            
            Text(feature.description)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 20)
                .padding(.top, 10)
            
            if feature.streetView ?? false {
                // Show street view related UI
            } else {
                // Show non-street view related UI
            }
            
            // You can add more custom UI based on your needs
        }
        .padding()
    }
}

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

struct FeatureDetailPage: View {
    let feature: CommonFeature // A single feature data
    
    var body: some View {
        VStack {
            Image(feature.image ?? "Heritage-Bg")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 200)
            
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

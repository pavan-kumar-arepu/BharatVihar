//
//  CommonFeatureDetailView.swift
//  BharatVihar
//
//  Created by Pavankumar Arepu on 13/08/23.
//

import Foundation
import SwiftUI

/*
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
        ZStack {
            Image("side-menu-bg") // Placeholder image
                .resizable()
                .aspectRatio(contentMode: .fit)
//                .frame(height: UIScreen.main.bounds.height * 0.3)
                .padding(.horizontal, 20)
            VStack {
                if let imageUrl = feature.image {
                    // Load the image directly here
                    RemoteImage(url: imageUrl)
                        .aspectRatio(contentMode: .fit)
                    //                    .frame(height: UIScreen.main.bounds.height * 0.3)
                        .frame(width: UIScreen.main.bounds.width - 40, height: UIScreen.main.bounds.width * 0.7) // Custom aspect ratio
                        .clipped() // Clip the image to the specified frame
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
}

*/

struct GenericFeatureDetailView: View {
    let featureData: [CommonFeature] // An array of feature data
    
    var body: some View {
        VStack(spacing: 0) {
            // 1st Section: Image View
            ImageView() // You need to implement ImageView separately
                .frame(height: UIScreen.main.bounds.height * 0.35)
            
            // 2nd Section: Collection View
            GridView(featureData: featureData)
                .frame(height: UIScreen.main.bounds.height * 0.1 * CGFloat(featureData.count / 2))
            Spacer()
        }
    }
}

struct ImageView: View {
    var body: some View {
        // Implement your image view here
        Rectangle()
            .fill(Color.blue) // Example background color
            .cornerRadius(20)
            .padding()// Rounded rect shape
    }
}

struct GridView: View {
    let featureData: [CommonFeature]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.flexible(), spacing: 30), GridItem(.flexible(), spacing: 10)], spacing: 10) {
                ForEach(featureData) { feature in
                    GridCell(feature: feature)
                }
            }
            .padding()
        }
    }
}

struct GridCell: View {
    let feature: CommonFeature
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(LinearGradient(gradient: Gradient(colors: [Color.red, Color.orange]), startPoint: .top, endPoint: .bottom))
                .frame(width: UIScreen.main.bounds.width * 0.4, height: UIScreen.main.bounds.height * 0.1)
            
            
            if let title = feature.title {
                Text(title)
                    .font(.headline)
            }
            
            if let subtitle = feature.subtitle {
                Text(subtitle)
                    .font(.subheadline)
            }
        }
        .foregroundColor(.white)
    }
}


struct GenericFeatureDetailView_Preview: PreviewProvider {
    static var previews: some View {
        let dataService = DataService.shared
        let cultureData = dataService.cachedIndiaData?.featuresDetails.culture ?? []

        GenericFeatureDetailView(featureData: cultureData)
    }
}

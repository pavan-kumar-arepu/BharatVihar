//
//  CommonFeatureDetailView.swift
//  BharatVihar
//
//  Created by Pavankumar Arepu on 13/08/23.
//

import Foundation
import SwiftUI

struct GenericFeatureDetailView: View {
    let featureData: [CommonFeature] // An array of feature data
    
    var body: some View {
        VStack(spacing: 0) {
            // 1st Section: Image View
            ImageView() // You need to implement ImageView separately
                .frame(height: UIScreen.main.bounds.height * 0.25)
                .opacity(0.35)
            
            Spacer()
            
            // 2nd Section: Collection View
            GridView(featureData: featureData)
//                .frame(height: UIScreen.main.bounds.height * 0.2 * CGFloat(featureData.count / 2))
            // TODO: This should not hardcoded
                .frame(height: 375)
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
        .shadow(radius: 10.0)
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

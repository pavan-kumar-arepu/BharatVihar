//
//  Feature2.swift
//  BharatVihar
//
//  Created by Pavankumar Arepu on 02/08/23.
//

import Foundation
import SwiftUI

struct Feature: Identifiable {
    let id = UUID()
    let name: String
    var isSelected: Bool = false
}

struct FeatureContainer: View {
    @State private var selectedFeatureIndex: Int? = 0
    @State private var features: [Feature] = [
        Feature(name: "Culture"),
        Feature(name: "Attractions"),
        Feature(name: "Awards"),
        Feature(name: "PrimeMinisters"),
        Feature(name: "3 Services"),
        Feature(name: "HistoryTimeline"),
        Feature(name: "Festivals")
    ]
        
    var body: some View {
        VStack {
            if let selectedFeatureIndex = selectedFeatureIndex {
                Text(features[selectedFeatureIndex].name) // Display selected feature as the Top Title
                    .font(.largeTitle)
                    .padding(.top, 20)
            }
            
            Spacer(minLength: 10)
            Spacer()
            
            if let selectedFeatureIndex = selectedFeatureIndex {
                FeatureDetailView(featureName: features[selectedFeatureIndex].name)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            
            Spacer()
            
            FeatureListView(features: features, selectedFeatureIndex: $selectedFeatureIndex)
        }
    }
}

struct FeatureListView: View {
    var features: [Feature] // No need for @Binding here
    @Binding var selectedFeatureIndex: Int?
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20) {
                ForEach(features.indices) { index in
                    Button(action: {
                        selectedFeatureIndex = index
                    }) {
                        Text(features[index].name)
                            .foregroundColor(Color.white)
                            .padding(10)
                            .background(features[index].isSelected ? Color.blue : Color.gray)
                            .cornerRadius(10)
                    }
                }
            }
            .padding(.horizontal, 20)
        }
        .padding(.top, 20)
    }
}


struct FeatureDetailView: View {
    let featureName: String
    
    var body: some View {
        switch featureName {
        case "Culture":
            Culture()
        case "Attractions":
            Attraction()
        case "Awards":
            Awards()
        case "PrimeMinisters":
            PrimeMinisters()
        case "3 Services":
            Services()
        case "HistoryTimeline":
            HistoryTimeline()
        case "Festivals":
            Festivals()
        default:
            EmptyView()
        }
    }
}

struct FeatureContainer_Preview: PreviewProvider {
    static var previews: some View {
        FeatureContainer()
    }
}





//
//  FeaturesTabBarContainer.swift
//  BharatVihar
//
//  Created by Pavankumar Arepu on 07/09/23.
//

import Foundation
import SwiftUI

struct FeatureCategory: Identifiable {
    let id = UUID()
    let name: String
    let logo: String
    let features: [String]
}
struct TabBarContainerView: View {
    
    @ObservedObject var viewModel: FeatureListViewModel

    @State private var selectedTabIndex = 0 // Track the selected tab index
    @State private var selectedFeature = "" // Track the selected feature name
    
    let categories: [FeatureCategory] = [
        FeatureCategory(name: "Culture", logo: "globe.central.south.asia.fill", features: ["Culture", "Attractions", "Languages"]),
        FeatureCategory(name: "Government", logo: "shield.fill", features: ["Services", "Minister", "Awards"]),
        FeatureCategory(name: "Information", logo: "info.circle.fill", features: ["Timeline", "HotNews", "AskAnyThing"]),
        FeatureCategory(name: "More", logo: "ellipsis.circle.fill", features: ["WomenPower", "MagicNumbers", "FlagHoisting"])
    ]
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(
                    gradient: Gradient(colors: [.green, .white, .green]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea(.all)
                
                VStack {
                    // 1st Part (Top): Tab view to display features horizontally
                    featureTopMenuView
                    
                    // 2nd Part (Middle): Detailed view of the selected feature
    //                FeatureDetailBaseView(features: categories[selectedTabIndex].features, selectedFeature: $selectedFeature)
    //                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    
                    FeatureDetailBaseView(viewModel: viewModel, selectedFeature: $selectedFeature)
                    
                    // 3rd Part (Bottom): Existing TabBar items
                    TabView(selection: $selectedTabIndex) {
                        ForEach(0..<categories.count) { index in
                            NavigationView {
    //                            FeatureTopMenuView(viewModel: viewModel, category: categories[index], selectedFeature: $selectedFeature)
                            }
                            .tabItem {
                                Text(categories[index].name)
                                Image(systemName: categories[index].logo)
                            }
                            .tag(index)
                        }
                    }
                }
            }
        }
    }
    
    var featureTopMenuView: some View {
        
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(categories[selectedTabIndex].features, id: \.self) { feature in
                    Button(action: {
                        // Handle tapping of feature in the tab view
                        selectedFeature = feature
                    }) {
                        Text(feature)
                            .font(.headline)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 10)
                            .background(selectedFeature == feature ? Color.blue : Color.gray)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                }
            }
        }
    }
}

struct FeatureTopMenuView: View {
    @ObservedObject var viewModel: FeatureListViewModel
    
    let category: FeatureCategory
    @Binding var selectedFeature: String
    
    var body: some View {
//        NavigationLink(destination: FeatureDetailBaseView(features: category.features, selectedFeature: $selectedFeature)) {
//            //Text("Show \(category.name) Features")
//                //.font(.largeTitle)
//        }
        
//        NavigationLink(destination: viewModel.destinationForTag(category.name)) {
            Text("Show \(category.name) Features")
                //.font(.largeTitle)
//        }
    
    }
}

struct FeatureDetailBaseView: View {
    @ObservedObject var viewModel: FeatureListViewModel

    @Binding var selectedFeature: String
    
    var body: some View {

        VStack {
            let cultureData = viewModel.dataService.cachedIndiaData?.featuresDetails.culture ?? []
            AnyView(GenericFeatureDetailView(featureData: cultureData))
        }.navigationBarTitle("Features")
    }
}


struct TabBarContainerView_Preview: PreviewProvider {
    static var previews: some View {
        let dataService = DataService.shared
        let viewModel = FeatureListViewModel(dataService: dataService)
        TabBarContainerView(viewModel: viewModel)
    }
}

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
        FeatureCategory(name: "Heritage", logo: "globe.central.south.asia.fill", features: ["culture", "attractions", "languages", "festivals"]),
        FeatureCategory(name: "Government", logo: "shield.fill", features: ["services", "leaders", "awards"]),
        FeatureCategory(name: "Information", logo: "info.circle.fill", features: ["historyTimeline", "HotNews", "AskAnyThing"]),
        FeatureCategory(name: "More", logo: "ellipsis.circle.fill", features: ["WomenPower", "numbers", "FlagHoisting"])
    ]
    
    // Define gradients for each category
    let gradients: [Gradient] = [
        Gradient(colors: [.green, .white]),
        Gradient(colors: [.blue, .white]), // Customize this gradient for Government
        Gradient(colors: [.purple, .white]), // Customize this gradient for Information
        Gradient(colors: [.orange, .white]) // Customize this gradient for More
    ]
    
    var body: some View {
        NavigationView {
            ZStack {
                GeometryReader { geometry in
                    // Use the selectedTabIndex to set the gradient background
                    LinearGradient(
                        gradient: gradients[selectedTabIndex],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                    .frame(width: geometry.size.width, height: geometry.size.height) // Set the height dynamically
                    .ignoresSafeArea(.all)
                }
                
                VStack {
                    
                    if #available(iOS 16.0, *) {
                        Text(categories[selectedTabIndex].name)
                            .font(.largeTitle) // Make the text a large title
                        //                        .padding(.leading, 10)
                            .frame(maxWidth: .infinity, alignment: .leading) // Left-align the entire view
                            .padding(.leading, 10)
                            .foregroundColor(.black)
                            .bold()
                    } else {
                        // Fallback on earlier versions
                    }
                    
                    // 1st Part (Top): Tab view to display features horizontally
                    //FeatureTopMenuView(selectedFeature: $selectedFeature,
                    //features: categories[selectedTabIndex].features)
                    // 2nd Part (Middle): Detailed view of the selected feature
                    FeatureDetailBaseView(viewModel: viewModel, selectedFeature: $selectedFeature)
                    
                    //                    Spacer()
                    
                    // 3rd Part (Bottom): Existing TabBar items
                    TabView(selection: $selectedTabIndex) {
                        ForEach(0..<categories.count) { index in
                            NavigationView {
                                // Content for each tab
                            }
                            .tabItem {
                                Text(categories[index].name)
                                Image(systemName: categories[index].logo)
                            }
                            .tag(index)
                        }
                    }
                    .background(Color.white) // Set the background color of the TabView to white
                    .accentColor(.blue) // Set the accent color to blue for the tabBar
                    .onChange(of: selectedTabIndex) { newIndex in
                        // Set the default feature when a new tab is selected
                        selectedFeature = categories[newIndex].features.first ?? ""
                    }
                }
            }
        }
        .onAppear {
            // Set the default feature when the view appears
            selectedFeature = categories[selectedTabIndex].features.first ?? ""
        }
    }
}

struct FeatureTopMenuView: View {
    @Binding var selectedFeature: String
    let features: [String]

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(features, id: \.self) { feature in
                    Button(action: {
                        // Handle tapping of feature in the tab view
                        selectedFeature = feature
                    }) {
                        Text(feature)
                            .font(.caption)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 10)
                            .background(selectedFeature == feature ? Color.green : Color.gray)
                            .foregroundColor(.white)
                            .cornerRadius(12)
                    }
                    .frame(height: 40) // Set a fixed height of 40 pixels
                }
            }
        }  .padding()
    }
}

struct FeatureDetailBaseView: View {
    @ObservedObject var viewModel: FeatureListViewModel
    
    @Binding var selectedFeature: String
    
    var body: some View {
        
        VStack {
            let selectedFeatureString = "\(selectedFeature)"
            let selectedFeatureData = viewModel.fetchDataForFeature(selectedFeature: selectedFeatureString)
            AnyView(GenericFeatureDetailView(featureData: selectedFeatureData))
        }
//        .navigationBarTitle("")
    }
}


struct TabBarContainerView_Preview: PreviewProvider {
    static var previews: some View {
        let dataService = DataService.shared
        let viewModel = FeatureListViewModel(dataService: dataService)
        TabBarContainerView(viewModel: viewModel)
    }
}

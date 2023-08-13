//
//  HomeViewModel.swift
//  BharatVihar
//
//  Created by Pavankumar Arepu on 13/08/23.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var welcomeTitle: String = ""
    @Published var welcomeSubtitle: String = ""
    @Published var exploreButtonTitle: String = "Let's Explore"
    @Published var isPresentingFeature = false

    
    private let dataService: DataService
    
    init(dataService: DataService) {
        self.dataService = dataService
        loadCachedData()
    }
    
    private func loadCachedData() {
        if let cachedData = dataService.getCachedIndiaData() {
            // Use cachedData to populate the view model properties
            welcomeTitle = cachedData.featuresDetails.home.first?.title ?? "Welcome"
            welcomeSubtitle = cachedData.featuresDetails.home.first?.description ?? "Hello"
            exploreButtonTitle = cachedData.featuresDetails.home.first?.subtitle ?? "Lets do it"
            // Update other properties as needed
        }
    }
}

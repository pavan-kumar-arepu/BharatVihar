//
//  FeatureViewModel.swift
//  BharatVihar
//
//  Created by Pavankumar Arepu on 13/08/23.
//

import Foundation

class FeatureListViewModel: ObservableObject {
    
    @Published var featureWelcomeTitle: String = ""
    @Published var welcomeParagraph: String = ""
    @Published var highlightedWords: [String] = []
    
    private let dataService: DataService
    
    init(dataService: DataService) {
        self.dataService = dataService
        loadCachedData()
    }
    
    private func loadCachedData() {
        if let cachedData = dataService.getCachedIndiaData() {
            // Use cachedData to populate the view model properties
            featureWelcomeTitle = cachedData.featuresDetails.featureList.first?.title ?? "Glimpse"
            welcomeParagraph = cachedData.featuresDetails.featureList.first?.description ?? "Welcome"
            highlightedWords = cachedData.featuresDetails.featureList.first?.highlightWords ?? []
            // Update other properties as needed
        }
    }
}

//
//  FeatureViewModel.swift
//  BharatVihar
//
//  Created by Pavankumar Arepu on 13/08/23.
//

import Foundation
import SwiftUI

class FeatureListViewModel: ObservableObject {
    
    var featureDestinations: [FeatureDestination<AnyView>] = []
    @Published var selectedFeatureTag: String? = nil
    @Published var commonFeatureData: [CommonFeature] = [] // Populate this array with the feature data
    @Published var featureWelcomeTitle: String = ""
    @Published var welcomeParagraph: String = ""
    @Published var highlightedWords: [String] = []
    
    let dataService: DataService
    
    init(dataService: DataService) {
        self.dataService = dataService
        loadCachedData()
        initializeFeatureDestinations()
    }
    
    // Function to determine the destination view based on the tappedWord
    func destinationForTag(_ tag: String?) -> AnyView {
        var view = AnyView(EmptyView())
        switch tag {
        case "History Timeline":
            let historyTimeLineData = dataService.cachedIndiaData?.featuresDetails.historyTimeline ?? []
            view = AnyView(GenericFeatureDetailView(featureData: historyTimeLineData))
        case "Cultures":
            let cultureData = dataService.cachedIndiaData?.featuresDetails.culture ?? []
            view = AnyView(GenericFeatureDetailView(featureData: cultureData))
        case "Festivals":
            let festivalsData = dataService.cachedIndiaData?.featuresDetails.festivals ?? []
            view = AnyView(GenericFeatureDetailView(featureData: festivalsData))
        case "three main Forces":
            let servicesData = dataService.cachedIndiaData?.featuresDetails.services ?? []
            view = AnyView(GenericFeatureDetailView(featureData: servicesData))
        case "Attractions":
            let attractionsData = dataService.cachedIndiaData?.featuresDetails.attractions ?? []
            view = AnyView(GenericFeatureDetailView(featureData: attractionsData))
        case "awards":
            let awardsData = dataService.cachedIndiaData?.featuresDetails.awards ?? []
            view = AnyView(GenericFeatureDetailView(featureData: awardsData))
            
        default:
            return AnyView(EmptyView()) // Default empty view
        }
        return view
    }
    
    private func initializeFeatureDestinations() {
        if let cultureData = dataService.cachedIndiaData?.featuresDetails.culture {
            commonFeatureData = cultureData
            let view = GenericFeatureDetailView(featureData: commonFeatureData)
            featureDestinations.append(FeatureDestination(tag: "culture", view: AnyView(view)))
        }
        
        // Add more destinations based on other feature data
        selectedFeatureTag = featureDestinations.first?.tag // Set the first tag as selected
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


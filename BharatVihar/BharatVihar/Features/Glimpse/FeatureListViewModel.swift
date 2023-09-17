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
    
    @Published var title: String = ""
      
      func setTitle(_ title: String) {
          self.title = title
      }
    
    init(dataService: DataService) {
        self.dataService = dataService
        loadCachedData()
        initializeFeatureDestinations()
    }
    
    // Function to determine the destination view based on the tappedWord
    func destinationForTag(_ tag: String?) -> AnyView {
        var view = AnyView(EmptyView())
        switch tag {
        case "historyTimeline":
            let historyTimeLineData = dataService.cachedIndiaData?.featuresDetails.historyTimeline ?? []
            view = AnyView(GenericFeatureDetailView(featureData: historyTimeLineData))
        case "Culture":
            let cultureData = dataService.cachedIndiaData?.featuresDetails.culture ?? []
            view = AnyView(GenericFeatureDetailView(featureData: cultureData))
        case "festivals":
            let festivalsData = dataService.cachedIndiaData?.featuresDetails.festivals ?? []
            view = AnyView(GenericFeatureDetailView(featureData: festivalsData))
        case "services":
            let servicesData = dataService.cachedIndiaData?.featuresDetails.services ?? []
            view = AnyView(GenericFeatureDetailView(featureData: servicesData))
        case "attractions":
            let attractionsData = dataService.cachedIndiaData?.featuresDetails.attractions ?? []
            view = AnyView(GenericFeatureDetailView(featureData: attractionsData))
        case "awards":
            let awardsData = dataService.cachedIndiaData?.featuresDetails.awards ?? []
            view = AnyView(GenericFeatureDetailView(featureData: awardsData))
        case "languages":
            view = AnyView(TransulateView())
            
        default:
            return AnyView(EmptyView()) // Default empty view
        }
        return view
    }
    
    /*
     FeatureCategory(name: "Culture", logo: "globe.central.south.asia.fill", features: ["culture", "attractions", "languages", "festivals"]),
     FeatureCategory(name: "Government", logo: "shield.fill", features: ["services", "leaders", "awards"]),
     FeatureCategory(name: "Information", logo: "info.circle.fill", features: ["historyTimeline", "HotNews", "AskAnyThing"]),
     FeatureCategory(name: "More", logo: "ellipsis.circle.fill", features: ["WomenPower", "numbers", "FlagHoisting"])
     */
    
    // Function to determine the destination view based on the tappedWord
    func fetchDataForFeature(selectedFeature: String) -> [CommonFeature] {
        var featureData = dataService.cachedIndiaData?.featuresDetails.culture  ?? []
        
        switch selectedFeature {
        case "historyTimeline":
            featureData = dataService.cachedIndiaData?.featuresDetails.historyTimeline ?? []
        case "culture":
            featureData = dataService.cachedIndiaData?.featuresDetails.culture ?? []
        case "festivals":
            featureData = dataService.cachedIndiaData?.featuresDetails.festivals ?? []
        case "services":
            featureData = dataService.cachedIndiaData?.featuresDetails.services ?? []
        case "attractions":
            featureData = dataService.cachedIndiaData?.featuresDetails.attractions ?? []
//        case "leaders":
//            featureData = dataService.cachedIndiaData?.featuresDetails.leaders ?? []
        case "awards":
            featureData = dataService.cachedIndiaData?.featuresDetails.awards ?? []
        case "languages", "HotNews","AskAnyThing","WomenPower","numbers","FlagHoisting","leaders":
            featureData = dataService.cachedIndiaData?.featuresDetails.culture ?? []
        default:
            featureData = dataService.cachedIndiaData?.featuresDetails.culture ?? []
        }
        return featureData
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


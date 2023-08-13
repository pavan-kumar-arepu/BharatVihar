//
//  GenericFeatureViewModel.swift
//  BharatVihar
//
//  Created by Pavankumar Arepu on 13/08/23.
//

import Foundation
import SwiftUI

/*
protocol FeatureData {
    var title: String { get }
    var description: String { get }
    var image: String { get }
    var coordinates: (latitude: Double, longitude: Double) { get }
    var streetView: Bool { get }
}


class GenericFeatureListViewModel<T>: ObservableObject where T: FeatureData {
    @Published var title: String = ""
    @Published var description: String = ""
    @Published var image: String = ""
    @Published var coordinates: (latitude: Double, longitude: Double) = (0.0, 0.0)
    @Published var streetView: Bool = false
    
    init(dataService: DataService, featureData: T) {
        self.title = featureData.title
        self.description = featureData.description
        self.image = featureData.image
        self.coordinates = (latitude: featureData.coordinates.latitude, longitude: featureData.coordinates.longitude)
        self.streetView = featureData.streetView
    }
}
*/

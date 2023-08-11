//
//  MainViewModel.swift
//  BharatVihar
//
//  Created by Pavankumar Arepu on 11/08/23.
//

import Foundation
import SwiftUI

class MainViewModel: ObservableObject {
        @Published var indiaData: IndiaData?
        @Published var backgroundImage: UIImage?
        
        private let dataService = DataService.shared
        
        func fetchData() {
            dataService.fetchIndiaData { [weak self] indiaData in
                if let indiaData = indiaData {
                    self?.indiaData = indiaData
                } else {
                    // Handle error
                }
            }
            
            // Fetch other images from JSON and download them
            if let backgroundImageURL = URL(string: "background_image_url_here") {
                dataService.fetchImage(from: backgroundImageURL) { [weak self] image in
                    if let image = image {
                        self?.backgroundImage = image
                    } else {
                        // Handle error
                    }
                }
            }
            
            // You can fetch and download other images in a similar manner
        }
        
        func downloadImageAndUpdateCache(from url: URL) {
            dataService.fetchImage(from: url) { [weak self] image in
                if let image = image {
                    // Save image to local file system and update cache
                } else {
                    // Handle error
                }
            }
        }
    }

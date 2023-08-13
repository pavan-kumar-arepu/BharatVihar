//
//  MainViewModel.swift
//  BharatVihar
//
//  Created by Pavankumar Arepu on 11/08/23.
//

import Foundation
import SwiftUI

/*
class MainViewModel: ObservableObject {
    @Published var indiaData: IndiaData?
    @Published var backgroundImage: UIImage?
    
    private let dataService = DataService.shared
    
    func fetchData() {
        dataService.fetchIndiaData { [weak self] indiaData in
            if let indiaData = indiaData {
                self?.indiaData = indiaData
                print("APK", self?.indiaData ?? "")
            } else {
                // Handle error
            }
        }
                // You can fetch and download other images in a similar manner
    }
    
    //https://firebasestorage.googleapis.com/v0/b/leaderofindia-4fb05.appspot.com/o/BackgroundImages%2Flanding-bg.png?alt=media&token=6e92f396-0a4b-4699-aa18-b9e86846fcaf
    
    func downloadImageAndUpdateCache(from url: URL) {
        dataService.fetchImage(url: url) { [weak self] image in
            if let image = image {
                // Save image to local file system and update cache
            } else {
                // Handle error
            }
        }
    }
    
    func cachedImage(for url: URL) -> UIImage? {
        let cacheDirectory = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first!
        let fileURL = cacheDirectory.appendingPathComponent(url.lastPathComponent)
        
        if let imageData = try? Data(contentsOf: fileURL),
           let image = UIImage(data: imageData) {
            return image
        }
        
        return nil
    }
    
    // Save the image to cache directory after downloading
    func saveImageToCache(image: UIImage, for url: URL) {
        let cacheDirectory = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first!
        let fileURL = cacheDirectory.appendingPathComponent(url.lastPathComponent)
        
        if let imageData = image.jpegData(compressionQuality: 0.8) {
            try? imageData.write(to: fileURL)
        }
    }

}

*/

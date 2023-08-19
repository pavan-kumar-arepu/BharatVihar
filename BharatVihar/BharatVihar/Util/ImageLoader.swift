//
//  ImageLoader.swift
//  BharatVihar
//
//  Created by Pavankumar Arepu on 12/08/23.
//

import Foundation
import SwiftUI

struct RemoteImage: View {
    let url: String
    
    @State private var image: UIImage? = nil
    
    var body: some View {
        if let image = image {
            Image(uiImage: image)
                .resizable()
        } else {
            Image(systemName: "photo") // Placeholder image
                .resizable()
                .onAppear(perform: loadImage)
        }
    }
    
    private func loadImage() {
        if let cachedImage = ImageCacheUtility.cachedImage(for: url) {
            self.image = cachedImage
        } else if let imageUrl = URL(string: url) {
            URLSession.shared.dataTask(with: imageUrl) { data, response, error in
                guard let data = data, error == nil,
                      let uiImage = UIImage(data: data) else {
                    return
                }
                DispatchQueue.main.async {
                    self.image = uiImage
                    ImageCacheUtility.saveImageToCache(image: uiImage, for: imageUrl)
                }
            }.resume()
        }
    }
}

struct ImageCacheUtility {
    static func cachedImage(for url: String) -> UIImage? {
        guard let imageUrl = URL(string: url) else {
            return nil
        }
        
        let cacheDirectory = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first!
        let fileURL = cacheDirectory.appendingPathComponent(imageUrl.lastPathComponent)
        
        if let imageData = try? Data(contentsOf: fileURL),
           let image = UIImage(data: imageData) {
            return image
        }
        
        return nil
    }
    
    static func saveImageToCache(image: UIImage, for url: URL) {
        let cacheDirectory = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first!
        let fileURL = cacheDirectory.appendingPathComponent(url.lastPathComponent)
        
        if let imageData = image.jpegData(compressionQuality: 0.8) {
            try? imageData.write(to: fileURL)
        }
    }
}

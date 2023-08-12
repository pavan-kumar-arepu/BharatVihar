//
//  ImageLoader.swift
//  BharatVihar
//
//  Created by Pavankumar Arepu on 12/08/23.
//

import Foundation
import SwiftUI

class ImageCacheUtility {
    static func cachedImage(for url: URL) -> UIImage? {
        let cacheDirectory = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first!
        let fileURL = cacheDirectory.appendingPathComponent(url.lastPathComponent)
        
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

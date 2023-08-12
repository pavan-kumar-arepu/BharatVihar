//
//  DataParser.swift
//  IndianLeaders
//
//  Created by Pavankumar Arepu on 23/06/23.
//

/// This is a Parser Class
///
/// Use this class to parse the data which is received from FirebaseRemote Config
///
import Foundation
import Alamofire
import UIKit

class DataParser {
    func parseIndiaData(from json: [String: Any]) -> IndiaData? {
        guard let indiaData = try? JSONSerialization.data(withJSONObject: json, options: []),
              let parsedIndiaData = try? JSONDecoder().decode(IndiaData.self, from: indiaData) else {
            print("Sorry buddy, there is some parsing issue!, please check")
            return nil
        }
        
        return parsedIndiaData
    }
    
//https://firebasestorage.googleapis.com/v0/b/leaderofindia-4fb05.appspot.com/o/BackgroundImages%2Flanding-bg.png?alt=media&token=6e92f396-0a4b-4699-aa18-b9e86846fcaf
    
//https://firebasestorage.googleapis.com/v0/b/leaderofindia-4fb05.appspot.com/o/Attractions%2Fattraction1.png?alt=media&token=1bf12b57-cba9-4496-9268-eeb614f63356
    
//https://firebasestorage.googleapis.com/v0/b/leaderofindia-4fb05.appspot.com/o/Attractions%2Fattraction2.png?alt=media&token=2f9fab1e-e124-40c8-af71-6846b567d920
    
//https://firebasestorage.googleapis.com/v0/b/leaderofindia-4fb05.appspot.com/o/Culture%2Fculture1.png?alt=media&token=1d7b2e9d-3499-4790-be7e-ff4d3efa82d0
    
//https://firebasestorage.googleapis.com/v0/b/leaderofindia-4fb05.appspot.com/o/Culture%2Fculture2.png?alt=media&token=c712f820-baf1-40b5-ab0e-7f9271ff6fce
    
    func downloadImage(from url: URL, completion: @escaping (UIImage?) -> Void) {
        let imageName = url.lastPathComponent // Extract image name from the URL
        let fileExtension = url.pathExtension // Extract file extension (e.g., "png", "jpg")
        
        let cacheURL = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask)[0]
        let imageCacheURL = cacheURL.appendingPathComponent("\(imageName).\(fileExtension)")
        
        // Check if the image is already in the cache
        if let cachedImage = UIImage(contentsOfFile: imageCacheURL.path) {
            completion(cachedImage)
            return
        }
        
        let destination: DownloadRequest.Destination = { _, _ in
            return (imageCacheURL, [.removePreviousFile, .createIntermediateDirectories])
        }
        
        AF.download(url, to: destination).response { response in
            switch response.result {
            case .success:
                if let fileURL = response.fileURL, let image = UIImage(contentsOfFile: fileURL.path) {
                    completion(image)
                } else {
                    completion(nil)
                }
            case .failure(let error):
                print("Image download error: \(error)")
                completion(nil)
            }
        }
    }}

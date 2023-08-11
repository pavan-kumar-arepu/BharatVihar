//
//  DataService.swift
//  IndianLeaders
//
//  Created by Pavankumar Arepu on 19/06/23.
//


import Foundation
import Firebase
import FirebaseRemoteConfig
import UIKit
import Alamofire


/// This class is 
///
/// Use this class from client, when we need 'Leaders' object
///

class DataService {
    static let shared = DataService()
    
    private let apiManager: FirebaseAPIManager
    private let dataParser: DataParser
    
    private init() {
        apiManager = FirebaseAPIManager.shared
        dataParser = DataParser()
    }
    
    func fetchIndiaData(completion: @escaping (IndiaData?) -> Void) {
        apiManager.fetchRemoteConfigData { jsonData in
            if let jsonData = jsonData, let parsedData = self.dataParser.parseIndiaData(from: jsonData) {
                completion(parsedData)
            } else {
                completion(nil)
            }
        }
    }
    
    func fetchBackgroundImage(url: URL, completion: @escaping (UIImage?) -> Void) {
        dataParser.downloadImage(from: url, completion: completion)
    }
    
    func fetchImage(from url: URL, completion: @escaping (UIImage?) -> Void) {
         let destination: DownloadRequest.Destination = { _, _ in
             let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
             let fileURL = documentsURL.appendingPathComponent("downloadedImage.jpg")

             return (fileURL, [.removePreviousFile, .createIntermediateDirectories])
         }

         AF.download(url, to: destination).response { response in
             switch response.result {
             case .success:
                 if let fileURL = response.fileURL, let image = UIImage(contentsOfFile: fileURL.path) {
                     // Update cache (optional)
                     completion(image)
                 } else {
                     completion(nil)
                 }
             case .failure(let error):
                 print("Image download error: \(error)")
                 completion(nil)
             }
         }
     }
    
    // Private method to parse IndiaData
       private func parseIndiaData(from json: [String: Any]) -> IndiaData? {
           // Parsing logic...
           return dataParser.parseIndiaData(from: json)
       }
    

    // You can add more methods here to fetch specific data from the parsed IndiaData structure.
}

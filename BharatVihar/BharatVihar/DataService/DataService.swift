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


protocol DataServiceProtocol {
    func fetchIndiaData(completion: @escaping (IndiaData?) -> Void)
    func fetchImage(url: URL, completion: @escaping (UIImage?) -> Void)
}


class DataService {
    static let shared = DataService()
    
    private let apiManager: FirebaseAPIManager
    private let dataParser: DataParser
    
    var cachedIndiaData: IndiaData?
    
    
    private init() {
        apiManager = FirebaseAPIManager.shared
        dataParser = DataParser()
    }
    
    
    func fetchIndiaData(completion: @escaping (IndiaData?) -> Void) {
        apiManager.fetchRemoteConfigData { jsonData in
            if let jsonData = jsonData, let parsedData = self.dataParser.parseIndiaData(from: jsonData) {
                self.cachedIndiaData = parsedData // Store the fetched data
                completion(parsedData)
                self.saveIndiaDataToLocalFile(parsedData) // Save the fetched data locally
            } else {
                completion(nil)
            }
        }
    }
    
    func fetchImage(url: URL, completion: @escaping (UIImage?) -> Void) {
        dataParser.downloadImage(from: url, completion: completion)
    }
    
    // Private method to parse IndiaData
    private func parseIndiaData(from json: [String: Any]) -> IndiaData? {
        // Parsing logic...
        return dataParser.parseIndiaData(from: json)
    }
    // You can add more methods here to fetch specific data from the parsed IndiaData structure.
    
    func saveIndiaDataToLocalFile(_ data: IndiaData) {
        do {
            let encoder = JSONEncoder()
            let encodedData = try encoder.encode(data)
            
            let fileURL = try FileManager.default.url(for: .documentDirectory,
                                                      in: .userDomainMask,
                                                      appropriateFor: nil,
                                                      create: false)
                .appendingPathComponent("indiaData.json")
            
            try encodedData.write(to: fileURL)
        } catch {
            print("Error saving IndiaData: \(error)")
        }
    }
    
    func loadIndiaDataFromLocalFile() -> IndiaData? {
        let fileURL = try? FileManager.default.url(for: .documentDirectory,
                                                   in: .userDomainMask,
                                                   appropriateFor: nil,
                                                   create: false)
            .appendingPathComponent("indiaData.json")
        
        guard let url = fileURL, let data = try? Data(contentsOf: url) else {
            return nil
        }
        
        do {
            let decoder = JSONDecoder()
            let decodedData = try decoder.decode(IndiaData.self, from: data)
            return decodedData
        } catch {
            print("Error loading IndiaData: \(error)")
            return nil
        }
    }
    
    func getCachedIndiaData() -> IndiaData? {
        return cachedIndiaData
    }
    
    func loadCachedIndiaData() {
        if let cachedData = loadIndiaDataFromLocalFile() {
            cachedIndiaData = cachedData
        }
    }
}

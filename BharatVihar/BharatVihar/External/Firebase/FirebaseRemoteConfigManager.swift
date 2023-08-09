//
//  FirebaseRemoteConfigManager.swift
//  IndianLeaders
//
//  Created by Pavankumar Arepu on 19/06/23.
//

import Foundation
import Firebase
import FirebaseRemoteConfig
import UIKit


protocol LeaderDataProvider {
    func fetchLeaders(completion: @escaping ([Leader]?, UIImage?) -> Void)
}

/// The FirebaseRemoteConfigManager acts as a coordinator, orchestrating the flow between the API request and the data parsing.
///
/// Use this class from client, when we need 'Leaders' object
///
class FirebaseRemoteConfigManager: LeaderDataProvider {
    
    static let shared = FirebaseRemoteConfigManager()
    
    private let apiManager: FirebaseAPIManager
    private let dataParser: DataParser
    
    private init() {
        apiManager = FirebaseAPIManager.shared
        dataParser = DataParser()
    }
    
    var leaders: [Leader] = []
    var backgroundImage: UIImage?
    
    /// Prepare 'leaders' data by consuming 'apiManager', 'dataParser'
    ///
    /// - Parameters:
    ///   - completion: Leaders Array
//    func fetchRemoteConfigData(completion: @escaping ([Leader]?) -> Void) {
//        apiManager.fetchRemoteConfigData { [weak self] json in
//            guard let json = json else {
//                completion(nil)
//                return
//            }
//
//            let parsedLeaders = self?.dataParser.parseLeaders(from: json)
//            self?.leaders = parsedLeaders ?? []
//            print("Remote Data retuned to caller!")
//            completion(parsedLeaders)
//        }
//    }
//
//    func fetchRemoteConfigData(completion: @escaping ([Leader]?) -> Void) {
//        apiManager.fetchRemoteConfigData { [weak self] json in
//            guard let json = json else {
//                completion(nil)
//                return
//            }
//
//            let parsedData = self?.dataParser.parseData(from: json)
//
//            if let backgroundImageURL = parsedData?.backgroundImage {
//                self?.dataParser.downloadBackgroundImage(from: backgroundImageURL) { image in
//                    if let backgroundImage = image {
//                        // Use the downloaded background image in your UI
//                        self?.backgroundImage = backgroundImage
//                    }
//                }
//            }
//
//            var parsedLeaders:[Leader] = []
//            if let pLeaders = parsedData?.leaders {
//                // Use the parsed leaders data in your app
//                parsedLeaders = pLeaders
//                self?.leaders = parsedLeaders
//            }
//
//            print("Remote Data retuned to caller!")
//            completion(parsedLeaders)
//        }
//    }
    
    func fetchRemoteConfigData(completion: @escaping ([Leader]?, UIImage?) -> Void) {
        apiManager.fetchRemoteConfigData { [weak self] json in
            guard let json = json else {
                completion(nil, nil)
                return
            }
            
            let parsedData = self?.dataParser.parseData(from: json)
            
            if let backgroundImageURL = parsedData?.backgroundImage {
                self?.dataParser.downloadBackgroundImage(from: backgroundImageURL) { image in
                    if let backgroundImage = image {
                        self?.backgroundImage = backgroundImage
                        var parsedLeaders: [Leader] = []
                        if let pLeaders = parsedData?.leaders {
                            parsedLeaders = pLeaders
                        }
                        completion(parsedLeaders, backgroundImage)
                    } else {
                        completion(nil, nil)
                    }
                }
            } else {
                var parsedLeaders: [Leader] = []
                if let pLeaders = parsedData?.leaders {
                    parsedLeaders = pLeaders
                }
                completion(parsedLeaders, nil)
            }
        }
    }
    
    
    
    /// To share leaders array to dataService
    ///
    /// - Returns: leaders array
    ///
    var getLeaders: [Leader] {
        return leaders
    }
    
    /// To share leaders array to dataService
    ///
    /// - Returns: BackgroundImage
    ///
    var getBackgroundImage: UIImage? {
        return backgroundImage
    }
    
    func fetchLeaders(completion: @escaping ([Leader]?, UIImage?) -> Void) {
        fetchRemoteConfigData { leaders, backgroundImage in
            completion(leaders, backgroundImage)
        }
    }
}


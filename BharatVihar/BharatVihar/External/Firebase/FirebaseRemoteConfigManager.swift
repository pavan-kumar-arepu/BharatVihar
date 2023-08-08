//
//  FirebaseRemoteConfigManager.swift
//  IndianLeaders
//
//  Created by Pavankumar Arepu on 19/06/23.
//

import Foundation
import Firebase
import FirebaseRemoteConfig


protocol LeaderDataProvider {
    func fetchLeaders(completion: @escaping ([Leader]?) -> Void)
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
    
    /// Prepare 'leaders' data by consuming 'apiManager', 'dataParser'
    ///
    /// - Parameters:
    ///   - completion: Leaders Array
    func fetchRemoteConfigData(completion: @escaping ([Leader]?) -> Void) {
        apiManager.fetchRemoteConfigData { [weak self] json in
            guard let json = json else {
                completion(nil)
                return
            }
            
            let parsedLeaders = self?.dataParser.parseLeaders(from: json)
            self?.leaders = parsedLeaders ?? []
            print("Remote Data retuned to caller!")
            completion(parsedLeaders)
        }
    }
    
    
    /// To share leaders array to dataService
    ///
    /// - Returns: leaders array
    ///
    var getLeaders: [Leader] {
        return leaders
    }
    
    func fetchLeaders(completion: @escaping ([Leader]?) -> Void) {
        fetchRemoteConfigData(completion: completion)
    }
}

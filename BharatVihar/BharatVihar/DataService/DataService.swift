//
//  DataService.swift
//  IndianLeaders
//
//  Created by Pavankumar Arepu on 19/06/23.
//


import Foundation
import Firebase
import FirebaseRemoteConfig


/// This class is 
///
/// Use this class from client, when we need 'Leaders' object
///

class DataService {
    static let shared = DataService()
    
    private let leaderDataProvider: LeaderDataProvider
    
    private init() {
        leaderDataProvider = FirebaseRemoteConfigManager.shared
    }
    
    
    
    /// Responsible to get leaders from DataService and send data to caller via completion Handler
    ///
    /// - Parameters:
    ///   - completion: Leader completion Handler
    ///   - height: The height of the rectangle.
    func getLeaders(completion: @escaping ([Leader]?) -> Void) {
        leaderDataProvider.fetchLeaders(completion: completion)
    }
}

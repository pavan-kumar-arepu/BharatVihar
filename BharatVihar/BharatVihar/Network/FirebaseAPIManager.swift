//
//  FirebaseAPIManager.swift
//  IndianLeaders
//
//  Created by Pavankumar Arepu on 23/06/23.
//

import Foundation
import Firebase

/// This is a class that represents a FirebaseAPI.
///
/// Use this class to hit FirebaseAPI and get the data from remoteConfig

class FirebaseAPIManager {
    
    static let shared = FirebaseAPIManager()
    
    private let remoteConfig = RemoteConfig.remoteConfig()
    
    private init() {
        let settings = RemoteConfigSettings()
        remoteConfig.configSettings = settings
        remoteConfig.setDefaults(fromPlist: "GoogleService-Info")
    }
    
    
    
    /// Hit a firebase API with help of remoteConfig file
    /// Prerequisite - Need to create a project in firebase console and set a project and download 'GoogleService-Info' and keep in project bundle
    ///
    /// - Parameters:
    ///   - completion: completionHandler
    func fetchRemoteConfigData(completion: @escaping ([String: Any]?) -> Void) {
        remoteConfig.fetch(withExpirationDuration: 0) { _, error in
            if error == nil {
                self.remoteConfig.activate { _, _ in
                    let json = self.remoteConfig.configValue(forKey: Constants.remoteJsonKeyName).jsonValue as? [String: Any]
                    print("Remote Data Received!")
                    completion(json)
                }
            } else {
                print("Error fetching remote config: \(error?.localizedDescription ?? "")")
                completion(nil)
            }
        }
    }
}

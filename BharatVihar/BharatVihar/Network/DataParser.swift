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

class DataParser {
    func parseLeaders(from json: [String: Any]) -> [Leader]? {
        guard let jsonData = try? JSONSerialization.data(withJSONObject: json, options: []) else {
            return nil
        }
        
        let decoder = JSONDecoder()
        do {
            let leaders = try decoder.decode([String: [Leader]].self, from: jsonData)["leaders"]
            print("Remote Data Parsed!")
            return leaders
        } catch {
            print("Error decoding leaders: \(error)")
            return nil
        }
    }
}

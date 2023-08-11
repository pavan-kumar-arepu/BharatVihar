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

/*
 

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
 */
//
//class DataParser {
//    func parseData(from json: [String: Any]) -> (backgroundImage: URL?, leaders: [Leader]?) {
//        guard let backgroundImageURLString = json["backgroundImage"] as? String,
//              let backgroundImageURL = URL(string: backgroundImageURLString) else {
//            return (nil, nil)
//        }
//
//        guard let leadersData = try? JSONSerialization.data(withJSONObject: json["leaders"], options: []),
//              let leaders = try? JSONDecoder().decode([Leader].self, from: leadersData) else {
//            return (backgroundImageURL, nil)
//        }
//
//        return (backgroundImageURL, leaders)
//    }
//}

//class DataParser {
//    func parseData(from json: [String: Any]) -> (backgroundImage: URL?, leaders: [Leader]?) {
//        guard let backgroundImageURLString = json["backgroundImage"] as? String,
//              let backgroundImageURL = URL(string: backgroundImageURLString) else {
//            return (nil, nil)
//        }
//
//        guard let leadersData = try? JSONSerialization.data(withJSONObject: json["leaders"], options: []),
//              let leaders = try? JSONDecoder().decode([Leader].self, from: leadersData) else {
//            return (backgroundImageURL, nil)
//        }
//
//        return (backgroundImageURL, leaders)
//    }
//
//    func downloadBackgroundImage(from url: URL, completion: @escaping (UIImage?) -> Void) {
//        AF.request(url).response { response in
//            if let data = response.data, let image = UIImage(data: data) {
//                completion(image)
//            } else {
//                completion(nil)
//            }
//        }
//    }
//}


//
//// Example usage
//if let json = try? JSONSerialization.jsonObject(with: jsonData, options: []) as? [String: Any] {
//    let dataParser = DataParser()
//    let parsedData = dataParser.parseData(from: json)
//
//    if let backgroundImageURL = parsedData.backgroundImage {
//        // Download the background image using the URL
//        // You can use libraries like Alamofire or URLSession to download the image
//        // Once the image is downloaded, you can use it in your UI
//    }
//
//    if let leaders = parsedData.leaders {
//        // Use the parsed leaders data in your app
//    }
//}
//


class DataParser {
    func parseIndiaData(from json: [String: Any]) -> IndiaData? {
        guard let indiaData = try? JSONSerialization.data(withJSONObject: json, options: []),
              let parsedIndiaData = try? JSONDecoder().decode(IndiaData.self, from: indiaData) else {
            return nil
        }
        
        return parsedIndiaData
    }
    
    func downloadImage(from url: URL, completion: @escaping (UIImage?) -> Void) {
        // Use your image downloading code here (e.g., Alamofire, URLSession, etc.)
    }
}

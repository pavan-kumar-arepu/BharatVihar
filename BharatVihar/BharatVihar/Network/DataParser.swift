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
    
    func downloadImage(from url: URL, completion: @escaping (UIImage?) -> Void) {
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
}

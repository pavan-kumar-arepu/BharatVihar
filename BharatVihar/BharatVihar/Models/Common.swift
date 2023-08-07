//
//  CommonFeature.swift
//  BharatVihar
//
//  Created by Pavankumar Arepu on 07/08/23.
//

import Foundation

//{
//  "title": "Taj Mahal",
//  "description": "The Taj Mahal is a white marble mausoleum.",
//  "image": "taj_mahal.jpg"
//}
//


// This is for common features like
// Attractions, Services, Festivals, Photogellary, historyTimeline, Culture

struct Common: Codable {
    let title: String
    let description: String
    let image: String
    let coordinates: Coordinates?
    let streetView: Bool?
    let streetViewImages: [String]?
}

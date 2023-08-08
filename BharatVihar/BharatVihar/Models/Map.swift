//
//  Maps.swift
//  BharatVihar
//
//  Created by Pavankumar Arepu on 07/08/23.
//

import Foundation
import Swift

//{
//  "states": [
//    {
//      "name": "Uttar Pradesh",
//      "population": "200 million",
//      "area": "243,286 sq km",
//      "parties": ["Party A", "Party B"]
//    },
//    // More states...
//  ],
//  "attractions": [
//    {
//      "title": "Taj Mahal",
//      "description": "The Taj Mahal is a white marble mausoleum.",
//      "streetView": "taj_mahal_streetview.jpg",
//      "smallImage": "taj_mahal_small.jpg"
//    },
//    // More attractions...
//  ]
//}
struct Coordinates: Codable {
    let latitude: Double
    let longitude: Double
}

struct CountryState: Codable {
    let name: String
    let population: String
    let area: String
    let parties: [String]
    let coordinates: Coordinates
}


struct MapFeature: Codable {
    let states: [CountryState]
    let attractions: [Common]
}

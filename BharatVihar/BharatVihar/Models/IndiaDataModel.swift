//
//  IndiaDataModel.swift
//  BharatVihar
//
//  Created by Pavankumar Arepu on 10/08/23.
//

import Foundation

struct Coordinates: Codable {
    let latitude: Double
    let longitude: Double
}

//With this modification, the decodeIfPresent method will handle the optional decoding of the "coordinates" field, and your decoding should work correctly for cases when the "coordinates" field is missing.
//Remember to make similar adjustments to other properties if they are also optional in your JSON data.

struct CommonFeature: Codable {
    let id: Int
    let title: String
    let subtitle: String?
    let description: String
    let image: String?
    let coordinates: Coordinates?
    let streetView: Bool?
    
    enum CodingKeys: String, CodingKey {
        case id, title, subtitle, description, image, coordinates, streetView
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        title = try container.decode(String.self, forKey: .title)
        subtitle = try container.decodeIfPresent(String.self, forKey: .subtitle)
        description = try container.decode(String.self, forKey: .description)
        image = try container.decodeIfPresent(String.self, forKey: .image)
        coordinates = try container.decodeIfPresent(Coordinates.self, forKey: .coordinates)
        streetView = try container.decodeIfPresent(Bool.self, forKey: .streetView)
    }
}


struct Category: Codable, Identifiable {
    let id: Int
    let title: String
    let items: [CommonFeature]
}

struct MapsInfo: Codable {
    let id: Int
    let stateName: String
    let population: String
    let area: String
    let parties: [String]
    let coordinates: Coordinates
}

struct Leader: Codable {
    let id: Int
    let name: String
    let pmNumber: PMNumber
    let party: String
    let rulingPeriod: String
    let about: String
    let achievements: String
    let logo: String
    let signatureLogo: String?
    
    enum CodingKeys: String, CodingKey {
        case id, name, pmNumber, party, rulingPeriod, about, achievements, logo, signatureLogo
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        print("APK",id)
        name = try container.decode(String.self, forKey: .name)
        print("APK",name)

        pmNumber = try container.decode(PMNumber.self, forKey: .pmNumber)
        print("APK",pmNumber)

        party = try container.decode(String.self, forKey: .party)
        print("APK",party)

        rulingPeriod = try container.decode(String.self, forKey: .rulingPeriod)
        print("APK",rulingPeriod)

        about = try container.decode(String.self, forKey: .about)
        print("APK",about)

        achievements = try container.decode(String.self, forKey: .achievements)
        print("APK",achievements)

        logo = try container.decode(String.self, forKey: .logo)
        print("APK",logo)

        signatureLogo = try container.decodeIfPresent(String.self, forKey: .signatureLogo) // Use decodeIfPresent for optional fields
        print("APK", signatureLogo)

    }
}

struct PMNumber: Codable {
    let times: Int
    let positions: [String]
}

struct QuizQuestion: Codable {
    let id: Int
    let question: String
    let options: [String]
    let correctAnswerIndex: Int
    let relatedFeature: String
}

struct IndiaData: Codable {
    let featuresDetails: FeaturesDetails
}

struct FeaturesDetails: Codable {
    let culture: [CommonFeature]
    let attractions: [CommonFeature]
    let awards: [CommonFeature]
    let services: [CommonFeature]
    let historyTimeline: [CommonFeature]
    let festivals: [CommonFeature]
    let numbers: [CommonFeature]
    let maps: [MapsInfo]
    let languages: [CommonFeature]
    let quiz: [QuizQuestion]
    let leaders: [Leader]
    let askGPT: [String]
    
    enum CodingKeys: String, CodingKey {
        case culture, attractions, awards, services, historyTimeline, festivals, numbers, maps, languages, quiz, leaders, askGPT
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        culture = try container.decode([CommonFeature].self, forKey: .culture)
        attractions = try container.decode([CommonFeature].self, forKey: .attractions)
        awards = try container.decode([CommonFeature].self, forKey: .awards)
        services = try container.decode([CommonFeature].self, forKey: .services)
        historyTimeline = try container.decode([CommonFeature].self, forKey: .historyTimeline)
        festivals = try container.decode([CommonFeature].self, forKey: .festivals)
        numbers = try container.decode([CommonFeature].self, forKey: .numbers)
        maps = try container.decode([MapsInfo].self, forKey: .maps)
        languages = try container.decode([CommonFeature].self, forKey: .languages)
        quiz = try container.decode([QuizQuestion].self, forKey: .quiz)
        leaders = try container.decode([Leader].self, forKey: .leaders)
        askGPT = try container.decode([String].self, forKey: .askGPT)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(culture, forKey: .culture)
        try container.encode(attractions, forKey: .attractions)
        try container.encode(awards, forKey: .awards)
        try container.encode(services, forKey: .services)
        try container.encode(historyTimeline, forKey: .historyTimeline)
        try container.encode(festivals, forKey: .festivals)
        try container.encode(numbers, forKey: .numbers)
        try container.encode(maps, forKey: .maps)
        try container.encode(languages, forKey: .languages)
        try container.encode(quiz, forKey: .quiz)
        try container.encode(leaders, forKey: .leaders)
        try container.encode(askGPT, forKey: .askGPT)
    }
}

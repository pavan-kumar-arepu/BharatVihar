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

struct CommonFeature: Codable {
    let id: String
    let title: String
    let description: String
    let image: String
    let coordinates: Coordinates
    let streetView: Bool
}

struct Category: Codable, Identifiable {
    let id: String
    let title: String
    let items: [CommonFeature]
}

struct MapsInfo: Codable {
    let id: String
    let stateName: String
    let population: String
    let area: String
    let parties: [String]
    let coordinates: Coordinates
}

struct Leader: Codable {
    let id: Int
    let name: String
    let pmNumber: String
    let party: String
    let rulingPeriod: String
    let about: String
    let achievements: String
    let logo: String
    let signatureLogo: String
}

struct QuizQuestion: Codable {
    let id: String
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

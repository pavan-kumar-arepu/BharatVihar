//
//  Leader.swift
//  BharatVihar
//
//  Created by Pavankumar Arepu on 08/08/23.
//

import Foundation
/// Leader Entity object

struct Leader: Hashable, Codable, Identifiable {
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

//
//  Extensions.swift
//  IndianLeaders
//
//  Created by Pavankumar Arepu on 19/06/23.
//

import Foundation
import SwiftUI

extension Image {
    static func imageWithName(name: String) -> Image {
        Image(name)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 50, height: 50)
            .padding(10) as! Image
    }
}

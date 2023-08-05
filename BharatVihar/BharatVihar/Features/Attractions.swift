//
//  Feature1.swift
//  BharatVihar
//
//  Created by Pavankumar Arepu on 02/08/23.
//

import Foundation
import SwiftUI

struct Attraction: View {
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 30) // Adjusted corner radius
                .stroke(Color.brown.opacity(1), lineWidth: 5) // Adjusted line width
                .padding(20)
        }
    }
}

//
//  HomeBackground.swift
//  BharatVihar
//
//  Created by Pavankumar Arepu on 02/08/23.
//

import Foundation
import SwiftUI

struct HBackground: View {
    var body: some View {
        Image("taj") // Make sure the image name matches the name of the image asset in your project
            .resizable()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .edgesIgnoringSafeArea(.all)
    }
}

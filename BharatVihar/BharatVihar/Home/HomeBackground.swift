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
        GeometryReader { geometry in
             Image("taj") // Make sure the image name matches the name of the image asset in your project
                 .resizable()
                 .aspectRatio(contentMode: .fill)
                 .frame(width: geometry.size.width, height: geometry.size.height)
                 .clipped()
         }
         .edgesIgnoringSafeArea(.all)
    }
}

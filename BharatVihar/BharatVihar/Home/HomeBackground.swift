//
//  HomeBackground.swift
//  BharatVihar
//
//  Created by Pavankumar Arepu on 02/08/23.
//

import Foundation
import SwiftUI


//struct HBackground: View {
//    var body: some View {
//        GeometryReader { geometry in
//            Image("taj") // Make sure the image name matches the name of the image asset in your project
//                .resizable()
//                .scaledToFill()
//                .frame(width: max(geometry.size.width, geometry.size.height))
//                .position(x: geometry.size.width / 2, y: geometry.size.height) // Adjust the y position as needed
//                .edgesIgnoringSafeArea(.all)
//        }
//    }
//}

struct HBackground: View {
    var body: some View {
        GeometryReader { geometry in
            Image("taj") // Make sure the image name matches the name of the image asset in your project
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
        }
        .edgesIgnoringSafeArea(.all)
    }
}

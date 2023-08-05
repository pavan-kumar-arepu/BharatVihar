//
//  HomeView.swift
//  BharatVihar
//
//  Created by Pavankumar Arepu on 02/08/23.
//

import Foundation
import SwiftUI

struct HomeView: View {
    @State private var isPresentingFeature = false

    var body: some View {
        ZStack {
            iPhoneLikeBorder()
            HBackground()
            VStack {
                Spacer()
                Button("Lets Explore") {
                    isPresentingFeature.toggle()
                }
            }
        }
        .fullScreenCover(isPresented: $isPresentingFeature) {
            FeatureView(isPresented: $isPresentingFeature) // Pass the binding here
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

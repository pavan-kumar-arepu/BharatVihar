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
        ZStack{
            HBackground()
            VStack {
                Spacer()
                Button("Open Features") {
                    isPresentingFeature.toggle()
                }
                .padding()
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

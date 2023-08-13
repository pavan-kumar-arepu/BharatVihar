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
            
            HBackground().background(.white)
            VStack {
                Spacer()
                
                Text("Welcome to Explore India")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.blue)
                    .padding()
                    .shadow(radius: 4)
                
                Spacer()
                
                Text("India, a land of rich cultural heritage and diverse landscapes, beckons you to embark on a journey of exploration. From the majestic Himalayas to the tranquil backwaters of Kerala, from the bustling streets of Mumbai to the serene temples of Varanasi, India's greatness shines through its traditions, spirituality, and vibrant tapestry of cultures.")

                    .font(.subheadline)
                    .fontWeight(.bold)
                    .foregroundColor(.blue)
                    .padding()
                    .shadow(radius: 4)
                    .multilineTextAlignment(.center)
                
                Spacer()
                
                Button("Let's Explore") {
                    isPresentingFeature.toggle()
                }
                .font(.headline)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
                .padding(.bottom, 40)
            }
            .padding()
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

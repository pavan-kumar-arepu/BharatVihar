//
//  HomeView.swift
//  BharatVihar
//
//  Created by Pavankumar Arepu on 02/08/23.
//

import Foundation
import SwiftUI

struct HomeView: View {

    @ObservedObject private var viewModel: HomeViewModel

    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ZStack {
            
            HBackground().background(.white)
            VStack {
                Spacer()
                
                Text(viewModel.welcomeTitle)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.blue)
                    .padding()
                    .shadow(radius: 4)
                
                Spacer()
                
                Text(viewModel.welcomeSubtitle)

                    .font(.subheadline)
                    .fontWeight(.bold)
                    .foregroundColor(.blue)
                    .padding()
                    .shadow(radius: 4)
                    .multilineTextAlignment(.center)
                
                Spacer()
                
                Button(viewModel.exploreButtonTitle) {
                    viewModel.isPresentingFeature.toggle()
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
        .fullScreenCover(isPresented: $viewModel.isPresentingFeature) {
            let dataService = DataService.shared
            let viewModel = FeatureListViewModel(dataService: dataService)
//            FeatureView(isPresented: $viewModel.isPresentingFeature, viewModel: viewModel)
//            IndiaFeaturesView()
            TabBarContainerView(viewModel: viewModel)
            // Pass the binding here
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        let dataService = DataService.shared
        let viewModel = HomeViewModel(dataService: dataService)

        HomeView(viewModel: viewModel)
    }
}

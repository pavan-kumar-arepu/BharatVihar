//
//  FeaturesView.swift
//  BharatVihar
//
//  Created by Pavankumar Arepu on 02/08/23.
//

import Foundation
import SwiftUI

struct FeatureDestination<T: View>: Identifiable {
    var id = UUID()
    let tag: String
    let view: T
}

struct FeatureView: View {
    @Binding var isPresented: Bool
    @ObservedObject var viewModel: FeatureListViewModel

    var body: some View {
        NavigationView {
            ZStack {
                iPhoneLikeBorder()
                HBackground().background(.white)
                VStack {
                    Spacer()
                    Text(viewModel.featureWelcomeTitle)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.blue)
                        .padding()
                        .shadow(radius: 4)
                    Spacer()
                    FeatureParagraphView(viewModel: viewModel)
                        .padding([.leading, .trailing])
                    Spacer()
                }
            }
            .navigationBarTitle("Glimpse", displayMode: .inline)
            .navigationBarItems(trailing: Button("Dismiss") {
                isPresented.toggle()
            })
        }
    }
}

struct FeatureView_Previews: PreviewProvider {
    static var previews: some View {
        let dataService = DataService.shared
        let viewModel = FeatureListViewModel(dataService: dataService)
        
        FeatureView(isPresented: .constant(false), viewModel: viewModel) // Provide a binding here
    }
}

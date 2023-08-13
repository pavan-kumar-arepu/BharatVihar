//
//  ContentView.swift
//  BharatVihar
//
//  Created by Pavankumar Arepu on 02/08/23.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        VStack {
            let dataService = DataService.shared
            let viewModel = HomeViewModel(dataService: dataService)
            HomeView(viewModel: viewModel)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

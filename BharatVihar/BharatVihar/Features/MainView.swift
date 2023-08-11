//
//  MainView.swift
//  BharatVihar
//
//  Created by Pavankumar Arepu on 11/08/23.
//

import Foundation
import SwiftUI

struct MainView: View {
    @StateObject private var viewModel = MainViewModel()
    
    var body: some View {
        VStack {
            // Display your data and images here
        }
        .onAppear {
            viewModel.fetchData()
        }
    }
}

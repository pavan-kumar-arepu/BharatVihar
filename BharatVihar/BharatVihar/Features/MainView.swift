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
    
    // Array of image URLs to download
    let imageUrls: [URL] = [
        URL(string: "https://firebasestorage.googleapis.com/v0/b/leaderofindia-4fb05.appspot.com/o/BackgroundImages%2Flanding-bg.png?alt=media&token=6e92f396-0a4b-4699-aa18-b9e86846fcaf")!,
        URL(string: "https://firebasestorage.googleapis.com/v0/b/leaderofindia-4fb05.appspot.com/o/Attractions%2Fattraction1.png?alt=media&token=1bf12b57-cba9-4496-9268-eeb614f63356")!,
        URL(string: "https://firebasestorage.googleapis.com/v0/b/leaderofindia-4fb05.appspot.com/o/Attractions%2Fattraction2.png?alt=media&token=2f9fab1e-e124-40c8-af71-6846b567d920")!,
        URL(string: "https://firebasestorage.googleapis.com/v0/b/leaderofindia-4fb05.appspot.com/o/Culture%2Fculture1.png?alt=media&token=1d7b2e9d-3499-4790-be7e-ff4d3efa82d0")!,
        URL(string: "https://firebasestorage.googleapis.com/v0/b/leaderofindia-4fb05.appspot.com/o/Culture%2Fculture2.png?alt=media&token=c712f820-baf1-40b5-ab0e-7f9271ff6fce")!
    ]
    
    var body: some View {
        VStack {
            // Iterate through the image URLs and load images
            ForEach(imageUrls, id: \.self) { url in
                if let cachedImage = viewModel.cachedImage(for: url) {
                    Image(uiImage: cachedImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: .infinity, maxHeight: 200)
                        .padding(.vertical, 10)
                } else {
                    AsyncImage(url: url) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        
                        // Save the downloaded image to FileManager
//                        viewModel.saveImageToCache(image: image, for: url)
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(maxWidth: .infinity, maxHeight: 200)
                    .padding(.vertical, 10)
                }
            }
            .onAppear {
                // Fetch data and initiate image downloads
                viewModel.fetchData()
                //            downloadImages()
            }
        }
    }
}

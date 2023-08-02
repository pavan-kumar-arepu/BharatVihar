//
//  FeaturePragraph.swift
//  BharatVihar
//
//  Created by Pavankumar Arepu on 02/08/23.
//

import Foundation
import SwiftUI
import UIKit

struct FeatureParagraphView: View {
    @State private var tappedWord: String?
    
    var body: some View {
        VStack {
            HighlightedTextView(paragraph: """
                       Explore the vibrant tapestry of India, a land that celebrates its rich heritage through captivating features. Immerse yourself in our Photogallery where stunning images vividly depict the nation's grandeur. Discover the enchantment of diverse Festivals in India that pulse with color and tradition. Embark on virtual journeys to India's top Tourist Attractions, offering immersive live street views.
                       """, highlightedWords: ["Photogallery", "tradition", "Attractions"], onTappedWord: { word in
                           self.tappedWord = word
                       })
            .frame(height: 300)
            .background(
                NavigationLink(
                    destination: PhotogalleryView(), // Replace with the actual AttractionView
                    tag: "Photogallery",
                    selection: $tappedWord,
                    label: EmptyView.init
                )
            )
            .background(
                NavigationLink(
                    destination: AttractionView(), // Replace with the actual AttractionView
                    tag: "Attractions",
                    selection: $tappedWord,
                    label: EmptyView.init
                )
            )
            .background(
                NavigationLink(
                    destination: TraditionView(), // Replace with the actual AttractionView
                    tag: "tradition",
                    selection: $tappedWord,
                    label: EmptyView.init
                )
            )
        }
    }
}

struct FeatureParagraphView_Previews: PreviewProvider {
    static var previews: some View {
        FeatureParagraphView() // Provide a binding here
    }
}

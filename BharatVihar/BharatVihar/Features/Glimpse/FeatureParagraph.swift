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
                       "Explore the vibrant tapestry of India, a land that celebrates its rich heritage through captivating features. Immerse yourself in our Photogallery where stunning images Maps vividly depict the nation's grandeur. Discover the enchantment of diverse Festivals in India that pulse with color and tradition. Embark on virtual journeys to India's top Tourist Attractions, offering immersive live street views. Uncover the intricate tapestry of India's Languages, each woven with history and culture. Delve into the mosaic of Cultures, a testament to unity in diversity. Honor the dedication of our three main Forces – Airforce, Army, and Navy – safeguarding our nation. Relive historical glory with a captivating History Timeline spanning 1940 to 2023. Engage with AI-powered Questions to satisfy your curiosity. Grasp India's enormity with fascinating Numbers – from populations to languages. Embark on geographic exploration with interactive Maps, unveiling attractions and state divisions."

                       """, highlightedWords: ["Photogallery", "tradition", "Festivals", "Attractions","Languages","Cultures","three main Forces","History Timeline","Numbers","Maps"], onTappedWord: { word in
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
            .background(
                NavigationLink(
                    destination: IndiaMapAnimation(), // Replace with the actual AttractionView
                    tag: "Maps",
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

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
    @ObservedObject var viewModel: FeatureListViewModel
    @State private var tappedWord: String?

    var body: some View {
        VStack {
            HighlightedTextView(paragraph: viewModel.welcomeParagraph,
                                highlightedWords: viewModel.highlightedWords,
                                onTappedWord: { word in
                                    self.tappedWord = word
                                })
                .frame(height: 300)
                .background(
                    NavigationLink(
                        destination: viewModel.destinationForTag(tappedWord),
                        tag: tappedWord ?? "nothingTappedInitially",
                        selection: $tappedWord,
                        label: EmptyView.init
                    )
                )
        }
    }
}



            /*
                .background(
                    NavigationLink(
                        destination: AttractionView(),
                        tag: "Photogallery",
                        selection: $tappedWord,
                        label: EmptyView.init
                    )
                )
             .background(
                 // Use NavigationLinks with viewModel to destinations
                 NavigationLink(
                     destination: PhotogalleryView(),
                     tag: "Photogallery",
                     selection: $tappedWord,
                     label: EmptyView.init
                 )
             )
                .background(
                    NavigationLink(
                        destination: TraditionView(),
                        tag: "tradition",
                        selection: $tappedWord,
                        label: EmptyView.init
                    )
                )
                .background(
                    NavigationLink(
                        destination: IndiaMapAnimation(),
                        tag: "Maps",
                        selection: $tappedWord,
                        label: EmptyView.init
                    )
                )
             */


struct FeatureParagraphView_Previews: PreviewProvider {
    static var previews: some View {
        let dataService = DataService.shared
        let viewModel = FeatureListViewModel(dataService: dataService)
        FeatureParagraphView(viewModel: viewModel) // Provide a binding here
    }
}

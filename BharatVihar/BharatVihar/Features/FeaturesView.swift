//
//  FeaturesView.swift
//  BharatVihar
//
//  Created by Pavankumar Arepu on 02/08/23.
//

import Foundation
import SwiftUI

struct FeatureView: View {
    @Binding var isPresented: Bool
    
    var body: some View {
        NavigationView {
            ZStack {
                HBackground()
                VStack {
                    Spacer()
                    Text("Glimpse of India")
                    Spacer() // Add a spacer to push the content to the top
                    FeatureParagraphView()
                        .padding([.leading, .trailing])
                    Spacer() 
                }
            }
            .navigationBarTitle("*", displayMode: .inline)
            .navigationBarItems(trailing: Button("Dismiss") {
                isPresented.toggle()
            })
        }
    }
}
struct AttractionView: View { // Create your AttractionView
    var body: some View {
        Text("AttractionView")
    }
}

struct PhotogalleryView: View { // Create your PhotogalleryView
    var body: some View {
        Text("Photogallery")
    }
}

struct TraditionView: View { // Create your PhotogalleryView
    var body: some View {
        Text("tradition")
    }
}

struct FeatureView_Previews: PreviewProvider {
    static var previews: some View {
        FeatureView(isPresented: .constant(false)) // Provide a binding here
    }
}

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
            VStack {
                FeatureParagraphView()
//                List {
//                    NavigationLink("Navigate to Other View 1", destination: OtherView1())
//                    NavigationLink("Navigate to Other View 2", destination: OtherView2())
//                }
            }
            .navigationBarTitle("Features", displayMode: .inline)
            .navigationBarItems(trailing: Button("Dismiss") {
                isPresented.toggle() // Try toggling the binding
            })
        }
    }
}

struct FeatureView_Previews: PreviewProvider {
    static var previews: some View {
        FeatureView(isPresented: .constant(false)) // Provide a binding here
    }
}

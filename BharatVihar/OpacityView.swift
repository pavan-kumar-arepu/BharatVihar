//
//  OpacityView.swift
//  BharatVihar
//
//  Created by Pavankumar Arepu on 12/08/23.
//

import Foundation
import SwiftUI

struct OpacityAnimationView: View {
    @State private var show = false
    
    var body: some View {
        VStack {
            Button("Toggle Opacity") {
                withAnimation {
                    show.toggle()
                }
            }
            
            Rectangle()
                .frame(width: 100, height: 100)
                .foregroundColor(.blue)
                .opacity(show ? 1 : 0)
                .animation(.easeInOut)
        }
    }
}


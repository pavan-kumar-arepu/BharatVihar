//
//  CommonBackground.swift
//  BharatVihar
//
//  Created by Pavankumar Arepu on 05/08/23.
//

import Foundation
import SwiftUI

struct iPhoneLikeBorder: View {
    var body: some View {
        ZStack {
           // Color(UIColor.systemBackground) // Simulate system background color
            
//            RoundedRectangle(cornerRadius: 40) // Adjusted corner radius
//                .stroke(Color.green.opacity(0.5), lineWidth: 10) // Adjusted line width
//                .padding(10) // Adjusted padding to show corners
            
            RoundedRectangle(cornerRadius: 30) // Adjusted corner radius
                .stroke(Color.orange.opacity(0.5), lineWidth: 5) // Adjusted line width
                .padding(20)
                .background(.clear)//
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        
        
        .edgesIgnoringSafeArea(.all)
    }
}

struct iPhoneLikeBorder_preview: PreviewProvider {
    static var previews: some View {
        iPhoneLikeBorder()
    }
}

//
//  ChakraImage.swift
//  IndianLeaders
//
//  Created by Pavankumar Arepu on 23/06/23.
//

import SwiftUI

struct ChakraImage: View {
    var body: some View {
        Image("AshokaChakra")
            .resizable()
            .scaledToFit()
            .frame(width: 200, height: 200)
    }
}

struct ChakraImage_Previews: PreviewProvider {
    static var previews: some View {
        ChakraImage()
    }
}

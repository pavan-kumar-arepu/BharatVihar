//
//  SplashView.swift
//  IndianLeaders
//
//  Created by Pavankumar Arepu on 23/06/23.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        // Customize your splash screen UI here
        Image("LaunchImage")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
        HBackground()

    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}

//
//  Onboarding.swift
//  BharatVihar
//
//  Created by Pavankumar Arepu on 12/08/23.
//

import Foundation
import SwiftUI


struct OnboardingScreenView: View {
    @EnvironmentObject var userData: UserData
    @State private var animateLogo = false
    @State private var animateText = false
    @State private var currentPage = 3
    @State private var isPresentingHome = false // Add this state

    
    struct ImageTextPair {
        let imageName: String
        let text: String
    }
    
    let contentPairs: [ImageTextPair] = [
        ImageTextPair(imageName: "fullOrange", text: "The top saffron band symbolizes the country's strength and courage."),
        ImageTextPair(imageName: "fullGreen", text: "The bottom green band signifies the land's fertility, growth, and auspiciousness."),
        ImageTextPair(imageName: "fullColour", text: "") // Placeholder for third swipe
    ]
    
    var body: some View {
        VStack {
           // LaunchLogo()
//                .offset(y: animateLogo ? (currentPage == 0 ? 200 : 50) : 200)
//                .animation(Animation.easeInOut(duration: 1).delay(0))
            
            TabView(selection: $currentPage) {
                welcomeView()
                
                ForEach(0..<contentPairs.count) { index in
                    contentView(pair: contentPairs[index], index: index)
                        .tag(index + 1)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            PageControl(numberOfPages: contentPairs.count + 1, currentPage: $currentPage)
            
            if currentPage == contentPairs.count {
                dismissButton()
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
        .edgesIgnoringSafeArea(.all)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) { // Delay to make sure the animation runs after appearance
                withAnimation {
                    animateLogo = true
                }
            }
        }
        .onChange(of: currentPage) { newValue in
            if newValue == 0 {
                animateLogo = false
            }
        }
        .fullScreenCover(isPresented: $isPresentingHome) {
            let dataService = DataService.shared
            let homeViewModel = HomeViewModel(dataService: dataService)
            HomeView(viewModel: homeViewModel)
        }
    }
    
    func welcomeView() -> some View {
        return AnyView(
            VStack {
                Text("Welcome to ExploreIndia")
                    .font(.title)
                    .bold()
                    .foregroundColor(Color.blue.opacity(0.8))
                    .padding(.bottom, 20)
                Text("In this app, we'll begin by exploring the national flag of India.")
                    .font(.headline)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 40)
            }
        )
    }
    
    func contentView(pair: ImageTextPair, index: Int) -> some View {
        return AnyView (
            ZStack {
                    Image(pair.imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(maxWidth: .infinity)
                
                Text(pair.text)
                    .font(.headline)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 40)
            }
        )
    }
    
    func dismissButton() -> some View {
          Button(action: {
              withAnimation(.easeInOut(duration: 0.5)) {
                  userData.onboardingShown = true
                  animateLogo = false
                  animateText = false
                  isPresentingHome = true // Present the HomeView
              }
          }) {
              Text("Get Started")
                  .fontWeight(.semibold)
                  .padding()
                  .frame(maxWidth: .infinity)
                  .background(Color.blue)
                  .foregroundColor(.white)
                  .cornerRadius(10)
                  .padding(.vertical, 20)
          }
      }
  }


struct OnboardingScreenView_preview: PreviewProvider {
    static var previews: some View {
        OnboardingScreenView()
    }
}

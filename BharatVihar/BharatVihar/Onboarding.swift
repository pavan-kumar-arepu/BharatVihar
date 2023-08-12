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
    @State private var currentPage = 0
    
    struct ImageTextPair {
        let imageName: String
        let text: String
    }
    
    let contentPairs: [ImageTextPair] = [
        ImageTextPair(imageName: "TopOrange", text: "The top saffron band symbolizes the country's strength and courage."),
        ImageTextPair(imageName: "BottomGreen", text: "The bottom green band signifies the land's fertility, growth, and auspiciousness."),
        ImageTextPair(imageName: "AshokaChakra", text: "The middle white band represents peace and truth, adorned with the Dharma Chakra.")
    ]
    
    var body: some View {
        VStack {
            LaunchLogo()
                .offset(y: animateLogo ? -60 : 0)
                .animation(Animation.easeInOut(duration: 1).delay(0))
            
            TabView(selection: $currentPage) {
                animatedElement(isVisible: $animateText, delay: 1) {
                    VStack{
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
                }
                ForEach(0..<contentPairs.count) { index in
                    let pair = contentPairs[index]
                    animatedElement(isVisible: $animateText, delay: Double(index) * 0.5 + 1.5) {
                        animateLogo = false // Hide the LaunchLogo after swiping to other pages

                        VStack{
                            Image(pair.imageName)
                                .resizable()
                                .scaledToFit()
                            Text(pair.text)
                                .font(.headline)
                                .foregroundColor(.gray)
                                .multilineTextAlignment(.center)
                                .padding(.bottom, 40)
                        }
                    }
                    .tag(index + 1)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            PageControl(numberOfPages: contentPairs.count + 1, currentPage: $currentPage)
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
        .edgesIgnoringSafeArea(.all)
        .onAppear {
            withAnimation {
                animateLogo = true
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0) {
                withAnimation {
                    animateText = true
                }
            }
        }
    }
    
    func animatedElement<Content: View>(isVisible: Binding<Bool>, delay: Double, @ViewBuilder content: () -> Content) -> some View {
        content()
            .opacity(isVisible.wrappedValue ? 1 : 0)
            .animation(Animation.easeInOut(duration: 1).delay(delay))
    }
}


struct OnboardingScreenView_preview: PreviewProvider {
    static var previews: some View {
        OnboardingScreenView()
    }
}


struct PageControl: UIViewRepresentable {
    var numberOfPages: Int
    @Binding var currentPage: Int
    
    func makeUIView(context: Context) -> UIPageControl {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = numberOfPages
        pageControl.currentPageIndicatorTintColor = .blue
        pageControl.pageIndicatorTintColor = .gray
        return pageControl
    }
    
    func updateUIView(_ uiView: UIPageControl, context: Context) {
        uiView.currentPage = currentPage
    }
}

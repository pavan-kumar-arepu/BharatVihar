//
//  BharatViharApp.swift
//  BharatVihar
//
//  Created by Pavankumar Arepu on 02/08/23.
//

import SwiftUI


import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        _ = DataService.shared
        return true
    }
}

@main
struct BharatViharApp: App {
    // register app delegate for Firebase setup

    @StateObject var userData = UserData()
    
    let onboardingShownKey = "onboardingShown"

    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    var body: some Scene {
        WindowGroup {
//            LaunchScreenView() // Show the launch screen first

            if UserDefaults.standard.bool(forKey: onboardingShownKey) {
                ContentView()
            } else {
                OnboardingScreenView()
                    .environmentObject(userData)
            }
        }
    }
}

class UserData: ObservableObject {
    @Published var onboardingShown = false
}

/*
 var body: some Scene {
     WindowGroup {
         LaunchScreenView() // Show the launch screen first
             .onAppear {
                 DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                     userData.showOnboarding = true
                     if UserDefaults.standard.bool(forKey: onboardingShownKey) {
                         ContentView()
                     } else {
                         OnboardingScreenView()
                             .environmentObject(userData)
                     }
                 }
             }
     }
     
 }
}
 */

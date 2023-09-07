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
        // Fetch data immediately when the app launches
//        DataService.shared.fetchIndiaData { _ in }
        
        DataService.shared.fetchIndiaData { indiaData in
            if let data = indiaData {
                // Data was fetched successfully, you can perform any necessary actions
                print("Fetched data:", data)
            } else {
                // Handle the absence of data or an error
                DataService.shared.loadCachedIndiaData()
                print("Failed to fetch data.")
            }
        }

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
//            let cachedData = DataService.shared.getCachedIndiaData() // Get cached data

            if UserDefaults.standard.bool(forKey: onboardingShownKey) {
                ContentView()
                    .environmentObject(userData)
//                    .onAppear {
//                        if cachedData != nil {
//                            // Handle the availability of cached data
//                        } else {
//                            // Handle the absence of cached data
//                        }
//                    }
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

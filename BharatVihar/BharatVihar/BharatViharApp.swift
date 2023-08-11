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

    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}


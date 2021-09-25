//
//  BuildifyApp.swift
//  Buildify
//
//  Created by Omer Rahmanovic on 8/21/21.
//

import SwiftUI
import Firebase

@main
struct BuildifyApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            LandingView()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        debugPrint("Setting up Firebase")
        FirebaseApp.configure()
        return true
    }
}

//
//  FirebaseAnalyticsTestApp.swift
//  FirebaseAnalyticsTest
//
//  Created by Игорь Чумиков on 02.09.2024.
//

import SwiftUI
import Firebase

@main
struct FirebaseAnalyticsTestApp: App {
    
    // 1
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}


// 2
// @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

//class AppDelegate: NSObject, UIApplicationDelegate {
//  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
//    FirebaseApp.configure()
//
//    return true
//  }
//}

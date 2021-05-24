//
//  LitDatabaseApp.swift
//  LitDatabase
//
//  Created by Sandro Dinklang on 5/10/21.
//

import SwiftUI
import Firebase

@main
struct LitBase: App {
    @UIApplicationDelegateAdaptor private var appDelegate: AppDelegate
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions:
            [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // Firebase initialization
        FirebaseApp.configure()
        return true
      }
}

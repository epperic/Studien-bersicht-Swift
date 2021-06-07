//
//  AppDelegate.swift
//  Studienuebersicht
//
//  Created by Eric Epp on 02.06.21.
//

import UIKit
import Firebase

class AppDelegate: NSObject, UIApplicationDelegate {
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions:
                        [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}

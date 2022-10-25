//
//  AppDelegate.swift
//  AryaNoble
//
//  Created by Rafi Mochamad Fahreza on 25/10/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        var rootVC = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController()
        window?.rootViewController = rootVC
        return true
    }

}


//
//  AppDelegate.swift
//  UI Templaye
//
//  Created by Mac on 17/03/21.
//  Copyright © 2021 jan. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow()
        
        let homeVC = HomeTabViewController()
        let nav = UINavigationController(rootViewController: homeVC)
        nav.isNavigationBarHidden = true
        self.window?.rootViewController = nav
        self.window?.makeKeyAndVisible()
        
        return true
    }

    


}


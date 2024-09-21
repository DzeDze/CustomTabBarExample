//
//  AppDelegate.swift
//  CustomTabBar
//
//  Created by Phuc Nguyen on 2024-09-19.
//

import UIKit

@main

class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        
        let vc1 = DummyViewController(with: .gray, and: "V1")
        let vc2 = DummyViewController(with: .orange, and: "V2")
        
        let tabVC = ViewController()
        tabVC.viewControllers = [vc1, vc2]
        
        window?.rootViewController = tabVC
        
        window?.makeKeyAndVisible()
        
        return true
    }
}


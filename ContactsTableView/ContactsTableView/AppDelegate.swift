//
//  AppDelegate.swift
//  ContactsTableView
//
//  Created by Daisy on 16/04/2019.
//  Copyright © 2019 고정아. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let FirstVC = ViewController()
        
        let naviVC = UINavigationController(rootViewController: FirstVC)
        
        window?.rootViewController = naviVC
        window?.makeKeyAndVisible()
        
        return true
    }
    
}


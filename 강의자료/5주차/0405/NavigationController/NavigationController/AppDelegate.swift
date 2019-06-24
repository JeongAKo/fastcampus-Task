//
//  AppDelegate.swift
//  NavigationController
//
//  Created by Daisy on 05/04/2019.
//  Copyright © 2019 고정아. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
 
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        
        let vc = ViewController()
        let naviController = UINavigationController(rootViewController: vc)
        window?.rootViewController = naviController
        window?.makeKeyAndVisible()
        
        return true
    }
    
}

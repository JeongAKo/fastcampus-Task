//
//  AppDelegate.swift
//  TapBarControllerExample
//
//  Created by Daisy on 05/04/2019.
//  Copyright © 2019 TapBarControllerExample. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        
        
        let tapBarController = UITabBarController()
        let firstVc = ViewController()
        let secondVc = SecondViewController()
        let thirdVc = ThirdViewController()
        
        
        
        let naviController = UINavigationController(rootViewController: firstVc)
        let naviC2 = UINavigationController(rootViewController: thirdVc)
        
        secondVc.title = "친구추가"
        firstVc.title = "친구"
        thirdVc.title = "설정"
        tapBarController.viewControllers = [naviController, naviC2]
        
        
        
        firstVc.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 0)
        thirdVc.tabBarItem = UITabBarItem(tabBarSystemItem: .more, tag: 1)
        
        
        
        
        window?.rootViewController = tapBarController
        window?.makeKeyAndVisible()
        
        // Override point for customization after application launch.
        return true
    }
    
    
    
}


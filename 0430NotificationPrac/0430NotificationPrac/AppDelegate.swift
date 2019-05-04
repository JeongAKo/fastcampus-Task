//
//  AppDelegate.swift
//  0430NotificationPrac
//
//  Created by Daisy on 30/04/2019.
//  Copyright © 2019 고정아. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let notiCenter = NotificationCenter.default

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)
        
        let firstVC = ViewController()
        let secondVC = SecondViewController()
        let thirdVC = ThirdViewController()
        
        let tabBarController = UITabBarController()
        let navi = UINavigationController(rootViewController: thirdVC)
        
        firstVC.tabBarItem = UITabBarItem(title: "Item", image: nil, tag: 0)
        secondVC.tabBarItem = UITabBarItem(title: "Item", image: nil, tag: 1)
        thirdVC.tabBarItem = UITabBarItem(title: "Challenge", image: nil, tag: 2)
        
        tabBarController.viewControllers = [firstVC, secondVC, navi]
        
        secondVC.addObserver()  // 위에서 호출해주었기 때문에 firstVC에서 만들어주면 다른 친구라서 여기서 옵저버를 호출해주어야 한다.
        
        window?.backgroundColor = .white
        window?.rootViewController = tabBarController   
        
        window?.makeKeyAndVisible()

        thirdVC.title = "Challenge"
        
        return true
       
    }
    
    
}

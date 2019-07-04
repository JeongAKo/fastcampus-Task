//
//  AppDelegate.swift
//  kakao
//
//  Created by Daisy on 20/05/2019.
//  Copyright © 2019 고정아. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    
    static var instance: AppDelegate {
        return (UIApplication.shared.delegate as! AppDelegate)
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
       initializeApp()
        
        return true
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        KOSession.handleDidEnterBackground()
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        KOSession.handleDidBecomeActive()
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        if KOSession.isKakaoAccountLoginCallback(url) {
            return KOSession.handleOpen(url)
        }
        return false
    }
    
    // MARK: - Initialize App
    
    private func initializeApp() {
        setupSessionChangeNotification()
        setupRootViewController()
    }
    
    private func setupSessionChangeNotification() {
        NotificationCenter.default.addObserver(
            self, selector: #selector(didChangeKaKaoSession(_:)), name: .KOSessionDidChange, object: nil
        )
    }
    
    @objc func didChangeKaKaoSession(_ noti: Notification) {
        guard let session = noti.object as? KOSession else { return }
        session.isOpen() ? print("Login") : print("Logout")
        print("didChangeKaKaoSession")
    }
    
    func setupRootViewController() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let navigationController = storyboard.instantiateInitialViewController() as! UINavigationController
        
        print("isOpen :", KOSession.shared().isOpen())
        let storyboardID = KOSession.shared().isOpen() ? "MainViewController" : "LoginViewController"
        let vc = storyboard.instantiateViewController(withIdentifier: storyboardID)
        navigationController.viewControllers = [vc]
        window?.rootViewController = navigationController
    }
   
}


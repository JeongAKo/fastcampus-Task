//
//  LoginViewController.swift
//  kakao
//
//  Created by Daisy on 20/05/2019.
//  Copyright © 2019 고정아. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    
    @IBAction func loginButtonDidtab(_ sender: UIButton) {
        guard let session = KOSession.shared() else {return}
        
        session.isOpen() ? session.close() : ()
        
        session.open { (error) in
            if !session.isOpen() {
                if let error = error as NSError? {
                    switch error.code {
                    case Int(KOErrorCancelled.rawValue):
                        print("canclled")
                    default: print(error.localizedDescription)
                    }
                }
            } else {
                print("Login success")
              AppDelegate.instance.setupRootViewController()
            }
        }
    }
    
}

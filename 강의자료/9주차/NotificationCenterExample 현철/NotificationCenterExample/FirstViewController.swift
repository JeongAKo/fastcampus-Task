//
//  FirstViewController.swift
//  NotificationCenterExample
//
//  Created by giftbot on 28/04/2019.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

final class FirstViewController: UIViewController {
    
    let notiCenter = NotificationCenter.default
    
    @IBOutlet private weak var myTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Swift 4.2+
        notiCenter.addObserver(
            self,
            selector: <#T##Selector#>,
            name: <#T##NSNotification.Name?#>,
            object: <#T##Any?#>
        )
        
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(didReceiveKeyboardNotification(_:)),
            name: UIResponder.keyboardWillShowNotification,
            object: nil)
        
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(didReceiveKeyboardNotification(_:)),
            name: UIResponder.keyboardWillHideNotification,
            object: nil)
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(test(_:)),
            name: UIApplication.didBecomeActiveNotification,
            object: nil)
        
    }
    
    @IBAction private func didEndOnExit(_ sender: Any) {}
    
    @objc func test(_ noti: Notification) {
        print("DidBecomeActiveNotification")
    }
    
    @objc func didReceiveKeyboardNotification(_ noti: Notification) {
        guard let userInfo = noti.userInfo,
            let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect,
        let duration = userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? TimeInterval
            else { return }
        
        if noti.name.rawValue == "UIKeyboardWillShowNotification" {
            UIView.animate(withDuration: duration) {
                self.myTextField.frame.origin.y = keyboardFrame.minY - 50
            }
        } else {
            UIView.animate(withDuration: duration) {
                self.myTextField.frame.origin.y += 50
            }
        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}

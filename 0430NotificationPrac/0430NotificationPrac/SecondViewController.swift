//
//  SecondViewController.swift
//  0430NotificationPrac
//
//  Created by Daisy on 30/04/2019.
//  Copyright © 2019 고정아. All rights reserved.
//

import UIKit

extension Notification.Name {
    static let changeColorNoti = Notification.Name("colorChangeNoti")
    
}

class SecondViewController: UIViewController {
    
    let noti = NotificationCenter.default
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addObserver()
    }
    
    func addObserver() {
        noti.addObserver(
            self,
            selector: #selector(selectorSetting(_:)),
            name: .changeColorNoti,
            object: nil
        )
        print("색이 나와야 하는데")
    }
    
    @objc func selectorSetting(_ sender: Notification) {
        //[Hashable: Any] => [String: UIColor]
        guard let typeChange = sender.userInfo as? [String: UIColor] else { return }
       
        view.backgroundColor = typeChange["color"]
           print("selectorSetting")
    }
    
    deinit {
        removeObserver()
    }
    
    func removeObserver() {
        noti.removeObserver(self)
    }
    
}

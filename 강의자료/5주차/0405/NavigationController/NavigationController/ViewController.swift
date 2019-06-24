//
//  ViewController.swift
//  NavigationController
//
//  Created by Daisy on 05/04/2019.
//  Copyright © 2019 고정아. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "FistVC"
        
        if #available(iOS 11.0, *) { // 버전
            navigationController?.navigationBar.prefersLargeTitles = true
        }
        let barButton = UIBarButtonItem(title: "push", style: .done, target: self, action: #selector(pushViewControlle))
        navigationItem.rightBarButtonItem = barButton
    }

    @objc private func pushViewControlle(_ sender: Any) {
        let secondVC = SecondViewController()
        navigationController?.pushViewController(secondVC, animated: true)
    }
}


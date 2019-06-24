//
//  ViewController.swift
//  TapBarControllerExample
//
//  Created by Daisy on 05/04/2019.
//  Copyright © 2019 TapBarControllerExample. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if #available(iOS 11.0, *) {
            navigationController?.navigationBar.prefersLargeTitles = true
        }
        let barButton = UIBarButtonItem(title: "친구추가", style: .done, target: self, action: #selector(pushViewController))
           navigationItem.rightBarButtonItem = barButton
        
        let firstTextField = UITextField(frame: CGRect(x: view.frame.width - 400, y: 250, width: view.frame.width - 200, height:350 ))
        firstTextField.backgroundColor = .blue
        
        
        view.addSubview(firstTextField)
    }

    @objc private func pushViewController(_ sender: Any) {
        let secondVC = SecondViewController()
        navigationController?.pushViewController(secondVC, animated: true)
    }

}



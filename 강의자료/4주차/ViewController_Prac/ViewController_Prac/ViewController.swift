//
//  ViewController.swift
//  ViewController_Prac
//
//  Created by Daisy on 26/03/2019.
//  Copyright © 2019 Daisy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        
        let secondButton = UIButton(type: .system)
        secondButton.frame = CGRect(x: 100, y: 100, width: 80, height: 40)
        secondButton.addTarget(self, action: #selector(presentSecondVC), for: .touchUpInside)
        secondButton.setTitle("Second", for: .normal)
        secondButton.setTitleColor(.blue, for: .normal)
        
        let thirdButton = UIButton(type: .system)
        thirdButton.frame = CGRect(x: 100, y: 200, width: 80, height: 40)
        thirdButton.addTarget(self, action: #selector(presentThirdVC), for: .touchUpInside)
        thirdButton.setTitle("Third", for: .normal)
        thirdButton.setTitleColor(.yellow, for: .normal)
   
        let dismissButton = UIButton(type: .system)
        dismissButton.frame = CGRect(x: 100, y: 300, width: 80, height: 40)
        dismissButton.addTarget(self, action: #selector(dismissVC), for: .touchUpInside)
        dismissButton.setTitle("Dismiss", for: .normal)
        dismissButton.setTitleColor(.black, for: .normal)
        
        
        view.addSubview(secondButton)
        view.addSubview(thirdButton)
        view.addSubview(dismissButton)
        
    }
    
    @objc func presentSecondVC() {
        let secondVC = secondViewController()
        present(secondVC, animated: true)
        
    }
    @objc func presentThirdVC() {
        let thirdVC = thirdViewController()
        present(thirdVC, animated: true)
    }
    
    @objc func dismissVC() {
        presentingViewController?.dismiss(animated: true)
  
    }
}


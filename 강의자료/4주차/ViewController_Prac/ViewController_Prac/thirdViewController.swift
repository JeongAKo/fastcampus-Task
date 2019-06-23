//
//  thirdViewController.swift
//  ViewController_Prac
//
//  Created by Daisy on 26/03/2019.
//  Copyright © 2019 Daisy. All rights reserved.
//

import UIKit

class thirdViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

      view.backgroundColor = .yellow
    
    let firstButton = UIButton(type: .system)
        firstButton.frame = CGRect(x: 100, y: 100, width: 80, height: 40)
        firstButton.addTarget(self, action: #selector(presentFirstVC), for: .touchUpInside)
        firstButton.setTitle("First", for: .normal)
        firstButton.setTitleColor(.red, for: .normal)
        
    let secondButton = UIButton(type: .system)
        secondButton.frame = CGRect(x: 100, y: 200, width: 80, height: 40)
        secondButton.addTarget(self, action: #selector(presentSecondVC), for: .touchUpInside)
        secondButton.setTitle("Second", for: .normal)
        secondButton.setTitleColor(.blue, for: .normal)
        
        let dismissButton = UIButton(type: .system)
        dismissButton.frame = CGRect(x: 100, y: 300, width: 80, height: 40)
        dismissButton.addTarget(self, action: #selector(thirdDismissVC), for: .touchUpInside)
        dismissButton.setTitle("Dismiss", for: .normal)
        dismissButton.setTitleColor(.black, for: .normal)
        
    view.addSubview(firstButton)
    view.addSubview(secondButton)
    view.addSubview(dismissButton)
    
    }
    
    @objc func presentFirstVC() {
        let firstVC =  ViewController()
        present(firstVC, animated: true)
        
    }
    
    @objc func presentSecondVC() {
        let secondVC = secondViewController()
        present(secondVC, animated: true)
    }
    
    @objc func thirdDismissVC() {
      presentingViewController?.dismiss(animated: true)
    }
    

}

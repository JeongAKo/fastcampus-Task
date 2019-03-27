//
//  ViewController.swift
//  ViewController
//
//  Created by Daisy on 26/03/2019.
//  Copyright © 2019 Daisy. All rights reserved.
//

import UIKit

class AViewController: UIViewController {
    
    var count: Int = 0
    let countLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .green
        
        let button = UIButton(type: .system)
        button.frame = CGRect(x: 120, y: 120, width: 200, height: 40)
        button.addTarget(self, action: #selector(presentACV), for: .touchUpInside)
        button.setTitle("AViewController", for: .normal)
        button.setTitleColor(.red, for: .normal)
        

        countLabel.frame = CGRect(x: 120, y: 360, width: 200, height: 40)
        countLabel.text = "\(self.count)"
        
        view.addSubview(button)
     
        view.addSubview(countLabel)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        countLabel.text = "\(self.count)"
    }
    
    @objc func presentACV() {
        let bVC = BViewController()
        self.count += 1
        bVC.count = self.count
        present(bVC, animated: true)
    }
    
    @objc func dismissCV() {
        presentingViewController?.dismiss(animated: true)
    }
    
}


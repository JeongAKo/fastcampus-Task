//
//  BViewController.swift
//  ViewController
//
//  Created by Daisy on 26/03/2019.
//  Copyright © 2019 Daisy. All rights reserved.
//

import UIKit

class BViewController: UIViewController {
    
    var count: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .yellow
        
//        let button = UIButton(type: .system)
//        button.frame = CGRect(x: 120, y: 120, width: 200, height: 40)
//        button.addTarget(self, action: #selector(presentAVC), for: .touchUpInside)
//        button.setTitle("AViewController", for: .normal)
//        button.setTitleColor(.blue, for: .normal)
        
        let disMissB = UIButton(type: .system)
        disMissB.frame = CGRect(x: 120, y: 240, width: 200, height: 40)
        disMissB.addTarget(self, action: #selector(dismissVC), for: .touchUpInside)
        disMissB.setTitle("Dismiss", for: .normal)
        disMissB.setTitleColor(.black, for: .normal)
        
        let countLabel = UILabel()
        countLabel.frame = CGRect(x: 120, y: 360, width: 200, height: 40)
        countLabel.text = "\(self.count)"
        
//        view.addSubview(button)
        view.addSubview(disMissB)
        view.addSubview(countLabel)
    }
    
//    @objc func presentAVC(){
//        let aVC = AViewController()
//        present(aVC, animated: true)
//    }
    
    @objc func dismissVC() {
        let priviousController = presentingViewController as! AViewController
        self.count += 1
        priviousController.count = self.count
        presentingViewController?.dismiss(animated: true)
    }
    
    
}

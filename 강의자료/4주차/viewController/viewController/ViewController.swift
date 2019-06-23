//
//  ViewController.swift
//  viewController
//
//  Created by Daisy on 26/03/2019.
//  Copyright © 2019 Daisy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let data = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("----------------[viewDidLoad]----------------")
        view.backgroundColor = .green
        
        let button = UIButton(type: .system)
        button.frame = CGRect(x: 100, y: 100, width: 80, height: 40 )
        button.addTarget(self, action: #selector(presentSecondVC), for: .touchUpInside)
        button.setTitle("프레젠트", for: .normal)
        button.setTitleColor(.red, for: .normal)
        
        view.addSubview(button)
    }
    
    
    
    @objc func presentSecondVC(){
        
        let secondVC = secondViewController()
        present(secondVC, animated: true)
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("----------------[vieWillapear]----------------")
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("----------------[viewDidAppear]----------------")
        
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("----------------[viewWillDisappear]----------------")
    }
    deinit {
        print("First Deinit")
        
    }
    
}


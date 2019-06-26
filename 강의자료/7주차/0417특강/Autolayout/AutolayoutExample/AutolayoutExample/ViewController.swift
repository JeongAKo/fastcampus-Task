//
//  ViewController.swift
//  AutoLayoutTask
//
//  Created by 이봉원 on 07/04/2019.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let aView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let bView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        autolayout()
    }
    
    func autolayout(){
        view.addSubview(aView)
        view.addSubview(bView)
        
        let guide = self.view.safeAreaLayoutGuide
        
        aView.topAnchor.constraint(equalTo: guide.topAnchor, constant: 30).isActive = true
        aView.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 10).isActive = true
        aView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        bView.topAnchor.constraint(equalTo: aView.topAnchor).isActive = true
        bView.heightAnchor.constraint(equalTo: aView.heightAnchor).isActive = true
        bView.leadingAnchor.constraint(equalTo: aView.trailingAnchor, constant: 10).isActive = true
        bView.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -10).isActive = true
        
        bView.widthAnchor.constraint(equalTo: aView.widthAnchor, multiplier: 2.0).isActive = true
    }
    
    
}


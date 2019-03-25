//
//  ViewController.swift
//  frameTest
//
//  Created by Daisy on 25/03/2019.
//  Copyright © 2019 Daisy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
//    let aView = UIView()
//    let bView = UIView()
//    let cView = UIView()
//    let dView = UIView()
    let eView = UIView()
    let fView = UIView()
    let gView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()

//        aView.frame = CGRect(x: 15, y: 300, width: 345, height: 100)
//        aView.backgroundColor = .gray
//
//        aView.frame = CGRect(x: 0, y: 0, width: 375, height: 668)
//        aView.backgroundColor = .white
//
//        bView.frame = CGRect(x: 15, y: 552, width: 345, height: 100)
//        bView.backgroundColor = .red
//
//        cView.frame = CGRect(x: 15, y: 15, width: 345, height: 150)
//        cView.backgroundColor = .blue
//
//        dView.frame = CGRect(x: 15, y: 200, width: view.frame.width - 30, height: 100)
//        dView.backgroundColor = .orange
        
        eView.frame = CGRect(x: 15, y: 15, width: view.frame.width - 30, height: view.frame.height - 30)
        eView.backgroundColor = .blue

        fView.frame = CGRect(x: 15, y: 15, width: view.frame.width - 60, height: view.frame.height - 60)
        fView.backgroundColor = .red

        gView.frame = CGRect(x: 15, y: 15, width: view.frame.width - 90, height: view.frame.height - 90)
        gView.backgroundColor = .green

//
//        print(dView.frame.width)
//        print(dView.frame.height)
        
        
//        view.addSubview(aView)
//        view.addSubview(bView)
//        view.addSubview(cView)
//        view.addSubview(dView)
        view.addSubview(eView)
        eView.addSubview(fView)
        fView.addSubview(gView)
     
//        eView.bounds.origin = CGPoint(x: 100, y: 100)
//        fView.bounds.origin = CGPoint(x: 50, y: 50)
        
    }


}


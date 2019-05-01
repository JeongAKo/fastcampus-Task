//
//  ViewController.swift
//  AutoLayoutPrac
//
//  Created by Daisy on 24/04/2019.
//  Copyright © 2019 고정아. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var scrollView = UIScrollView()
    
    var redView = UIView()
    var greenView = UIView()
    var blueView = UIView()
    var yellowView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(view.safeAreaInsets)
//        scrollView.frame = view.frame
        
        redView.backgroundColor = .red
        greenView.backgroundColor = .green
        blueView.backgroundColor = .blue
        yellowView.backgroundColor = .yellow
        
        view.addSubview(scrollView)
        
        scrollView.addSubview(redView)
        scrollView.addSubview(greenView)
        scrollView.addSubview(blueView)
        scrollView.addSubview(yellowView)
        
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    
        redView.translatesAutoresizingMaskIntoConstraints = false
        redView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        redView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        redView.trailingAnchor.constraint(equalTo: greenView.leadingAnchor).isActive = true
        redView.bottomAnchor.constraint(equalTo: blueView.topAnchor).isActive = true
        redView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        redView.heightAnchor.constraint(equalTo: scrollView.heightAnchor).isActive = true
        
        greenView.translatesAutoresizingMaskIntoConstraints = false
        greenView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        greenView.leadingAnchor.constraint(equalTo: redView.trailingAnchor).isActive = true
        greenView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        greenView.bottomAnchor.constraint(equalTo: yellowView.topAnchor).isActive =  true
        greenView.widthAnchor.constraint(equalTo: redView.widthAnchor).isActive = true
        greenView.heightAnchor.constraint(equalTo: redView.heightAnchor).isActive = true

        
        blueView.translatesAutoresizingMaskIntoConstraints = false
        blueView.topAnchor.constraint(equalTo: redView.bottomAnchor).isActive = true
        blueView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        blueView.trailingAnchor.constraint(equalTo: yellowView.leadingAnchor).isActive = true
        blueView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        blueView.widthAnchor.constraint(equalTo: redView.widthAnchor).isActive = true
        blueView.heightAnchor.constraint(equalTo: redView.heightAnchor).isActive = true
        
        yellowView.translatesAutoresizingMaskIntoConstraints = false
        yellowView.topAnchor.constraint(equalTo: greenView.bottomAnchor).isActive = true
        yellowView.leadingAnchor.constraint(equalTo: blueView.trailingAnchor).isActive = true
        yellowView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        yellowView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        yellowView.widthAnchor.constraint(equalTo: redView.widthAnchor).isActive = true
        yellowView.heightAnchor.constraint(equalTo: redView.heightAnchor).isActive = true
        
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print(view.safeAreaInsets)
    }
}


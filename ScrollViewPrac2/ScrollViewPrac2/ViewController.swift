//
//  ViewController.swift
//  ScrollViewPrac2
//
//  Created by Daisy on 25/04/2019.
//  Copyright © 2019 고정아. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var scrollView = UIScrollView()
    
    var backgroundleft = UIView()
    var backgroundViewright = UIView()
    var secondBackRight = UIView()
    var secondBackLeft = UIView()
    var verticalLeft = UIView()
    var verticalRight = UIView()
    var horizonTop = UIView()
    var horizonBottom = UIView()
    var button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(scrollView)
        scrollView.addSubview(backgroundleft)
        scrollView.addSubview(backgroundViewright)
        scrollView.addSubview(secondBackLeft)
        scrollView.addSubview(secondBackRight)
        scrollView.addSubview(verticalLeft)
        scrollView.addSubview(verticalRight)
        scrollView.addSubview(horizonTop)
        scrollView.addSubview(horizonBottom)
        scrollView.addSubview(button)
        
        backgroundleft.backgroundColor = .black
        backgroundViewright.backgroundColor = .black
        secondBackLeft.backgroundColor = .yellow
        secondBackRight.backgroundColor = .green
        verticalLeft.backgroundColor = .red
        verticalRight.backgroundColor = .red
        horizonTop.backgroundColor = .blue
        horizonBottom.backgroundColor = .blue
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        backgroundleft.translatesAutoresizingMaskIntoConstraints = false
        backgroundleft.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        backgroundleft.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        backgroundleft.trailingAnchor.constraint(equalTo: backgroundViewright.leadingAnchor).isActive = true
        backgroundleft.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        backgroundleft.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        backgroundleft.heightAnchor.constraint(equalTo: scrollView.heightAnchor).isActive = true
        
        backgroundViewright.translatesAutoresizingMaskIntoConstraints = false
        backgroundViewright.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        backgroundViewright.leadingAnchor.constraint(equalTo: backgroundleft.trailingAnchor).isActive = true
        backgroundViewright.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        backgroundViewright.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        backgroundViewright.widthAnchor.constraint(equalTo: backgroundleft.widthAnchor).isActive = true
        backgroundViewright.heightAnchor.constraint(equalTo: backgroundleft.heightAnchor).isActive = true
        
        secondBackLeft.translatesAutoresizingMaskIntoConstraints = false
        secondBackLeft.topAnchor.constraint(equalTo: backgroundleft.topAnchor, constant: 20).isActive = true
        secondBackLeft.leadingAnchor.constraint(equalTo: backgroundleft.leadingAnchor, constant: 20).isActive = true
        secondBackLeft.trailingAnchor.constraint(equalTo: secondBackRight.leadingAnchor).isActive = true
        secondBackLeft.bottomAnchor.constraint(equalTo: backgroundleft.bottomAnchor, constant: -20).isActive = true
        secondBackLeft.widthAnchor.constraint(equalTo: backgroundleft.widthAnchor, constant: -20).isActive = true
        secondBackLeft.heightAnchor.constraint(equalTo: backgroundleft.heightAnchor, constant: -40).isActive = true
        
        secondBackRight.translatesAutoresizingMaskIntoConstraints = false
        secondBackRight.topAnchor.constraint(equalTo: backgroundViewright.topAnchor, constant: 20).isActive = true
        secondBackRight.leadingAnchor.constraint(equalTo: secondBackLeft.trailingAnchor).isActive = true
        secondBackRight.trailingAnchor.constraint(equalTo: backgroundViewright.trailingAnchor, constant: -20).isActive = true
        secondBackRight.bottomAnchor.constraint(equalTo: backgroundViewright.bottomAnchor, constant: 20).isActive = true
        secondBackRight.widthAnchor.constraint(equalTo: backgroundleft.widthAnchor, constant:  -20).isActive = true
        secondBackRight.heightAnchor.constraint(equalTo: backgroundleft.heightAnchor, constant: -40).isActive = true
        
        verticalLeft.translatesAutoresizingMaskIntoConstraints = false
        verticalLeft.topAnchor.constraint(equalTo: secondBackLeft.topAnchor, constant: 20).isActive = true
        verticalLeft.leadingAnchor.constraint(equalTo: secondBackLeft.leadingAnchor, constant: 20).isActive = true
        verticalLeft.trailingAnchor.constraint(equalTo: verticalRight.leadingAnchor, constant: -20).isActive = true
        verticalLeft.bottomAnchor.constraint(equalTo: secondBackLeft.bottomAnchor, constant: -20).isActive = true
        verticalLeft.widthAnchor.constraint(equalTo: verticalRight.widthAnchor).isActive = true
        verticalLeft.heightAnchor.constraint(equalTo: verticalRight.heightAnchor).isActive = true

        verticalRight.translatesAutoresizingMaskIntoConstraints = false
        verticalRight.topAnchor.constraint(equalTo: secondBackLeft.topAnchor, constant: 20).isActive = true
        verticalRight.leadingAnchor.constraint(equalTo: verticalLeft.trailingAnchor, constant: 20).isActive = true
        verticalRight.trailingAnchor.constraint(equalTo: secondBackLeft.trailingAnchor, constant: -20).isActive = true
        verticalRight.bottomAnchor.constraint(equalTo: secondBackLeft.bottomAnchor, constant: -20).isActive = true
        verticalRight.widthAnchor.constraint(equalTo: verticalLeft.widthAnchor).isActive = true
        verticalRight.heightAnchor.constraint(equalTo: verticalLeft.heightAnchor).isActive = true

        horizonTop.translatesAutoresizingMaskIntoConstraints = false
        horizonTop.topAnchor.constraint(equalTo: secondBackRight.topAnchor, constant: 20).isActive = true
        horizonTop.leadingAnchor.constraint(equalTo: secondBackRight.leadingAnchor, constant: 20).isActive = true
        horizonTop.trailingAnchor.constraint(equalTo: secondBackRight.trailingAnchor, constant: -20).isActive = true
        horizonTop.bottomAnchor.constraint(equalTo: horizonBottom.topAnchor, constant: -20).isActive = true
        horizonTop.widthAnchor.constraint(equalTo: horizonBottom.widthAnchor).isActive = true
        horizonTop.heightAnchor.constraint(equalTo: horizonBottom.heightAnchor).isActive = true
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.centerXAnchor.constraint(equalTo: horizonTop.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: horizonTop.centerYAnchor).isActive = true
        button.widthAnchor.constraint(equalTo: horizonTop.widthAnchor, multiplier: 0.2).isActive = true
        button.heightAnchor.constraint(equalTo: horizonTop.heightAnchor, multiplier: 0.5).isActive = true
        button.setTitle("Button", for: .normal)
        button.backgroundColor = .yellow


        horizonBottom.translatesAutoresizingMaskIntoConstraints = false
        horizonBottom.topAnchor.constraint(equalTo: horizonTop.bottomAnchor, constant: 20).isActive = true
        horizonBottom.leadingAnchor.constraint(equalTo: secondBackRight.leadingAnchor, constant: 20).isActive = true
        horizonBottom.trailingAnchor.constraint(equalTo: secondBackRight.trailingAnchor, constant: -20).isActive = true
        horizonBottom.bottomAnchor.constraint(equalTo: secondBackLeft.bottomAnchor, constant: -20).isActive = true
        horizonBottom.widthAnchor.constraint(equalTo: horizonTop.widthAnchor).isActive = true
        horizonBottom.heightAnchor.constraint(equalTo: horizonTop.heightAnchor).isActive = true

        
        
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print(view.safeAreaInsets)
    }
    
    
    
}


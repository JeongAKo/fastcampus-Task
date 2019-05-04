//
//  ViewController.swift
//  0430NotificationPrac
//
//  Created by Daisy on 30/04/2019.
//  Copyright © 2019 고정아. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let noti = NotificationCenter.default
    
    let redLabel: UILabel = {
        let redLabel = UILabel()
        redLabel.translatesAutoresizingMaskIntoConstraints = false
        return redLabel
    }()
    
    let greenLabel: UILabel = {
        let greenLabel = UILabel()
        greenLabel.translatesAutoresizingMaskIntoConstraints = false
        return greenLabel
    }()
    
    let blueLabel: UILabel = {
        let blueLabel = UILabel()
        blueLabel.translatesAutoresizingMaskIntoConstraints = false
        return blueLabel
    }()
    
    let alpha: UILabel = {
        let alpha = UILabel()
        alpha.translatesAutoresizingMaskIntoConstraints = false
        return alpha
    }()
    
    let redSlider: UISlider = {
        let redSilder = UISlider()
        redSilder.translatesAutoresizingMaskIntoConstraints = false
        return redSilder
    }()
    
    let greenSlider: UISlider = {
        let greenSlider = UISlider()
        greenSlider.translatesAutoresizingMaskIntoConstraints = false
        return greenSlider
    }()
    
    let blueSlider: UISlider = {
        let blueSlider = UISlider()
        blueSlider.translatesAutoresizingMaskIntoConstraints = false
        return blueSlider
    }()
    
    let alphaSlider: UISlider = {
        let alphaSlider = UISlider()
        alphaSlider.translatesAutoresizingMaskIntoConstraints = false
        return alphaSlider
    }()
    
    let button: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Set Color", for: .normal)
        button.tintColor = #colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configuration()
        addSubView()
        autoLayout()
        button.addTarget(self, action: #selector(setColor(_:)), for: .touchUpInside)
        
    }
    
    
    @objc func setColor(_ sender: UIButton) {
        print(redSlider.value)
           print("버튼 눌렀지롱")
        var red = CGFloat(redSlider.value)
        var green = CGFloat(greenSlider.value)
        var blue = CGFloat(blueSlider.value)
        var alphaColor = CGFloat(alphaSlider.value)
        
        let color: UIColor = .init(red: red, green: green, blue: blue, alpha: alphaColor)
        
        noti.post(name: .changeColorNoti, object: sender, userInfo: ["color" : color])
    }
    
    func configuration() {
        redLabel.text = "Red"
        greenLabel.text = "Green"
        blueLabel.text = "Blue"
        alpha.text = "Alpha"
    }
    
    func addSubView() {
        view.addSubview(redLabel)
        view.addSubview(greenLabel)
        view.addSubview(blueLabel)
        view.addSubview(alpha)
        view.addSubview(redSlider)
        view.addSubview(greenSlider)
        view.addSubview(blueSlider)
        view.addSubview(alphaSlider)
        view.addSubview(button)
    }
    
    func autoLayout() {
        let guide = view.safeAreaLayoutGuide
        let margin: CGFloat = 20
        
        NSLayoutConstraint.activate([
            
            redLabel.topAnchor.constraint(equalTo: guide.topAnchor, constant: margin * 3),
            redLabel.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: margin),
            redLabel.trailingAnchor.constraint(equalTo: redSlider.leadingAnchor),
            redLabel.centerYAnchor.constraint(equalTo: redSlider.centerYAnchor),
            
            
            redSlider.topAnchor.constraint(equalTo: guide.topAnchor, constant: margin * 3),
            redSlider.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant:  -margin),
            redSlider.widthAnchor.constraint(equalTo: redLabel.widthAnchor, multiplier: 3),
            
            greenLabel.topAnchor.constraint(equalTo: redLabel.bottomAnchor),
            greenLabel.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: margin),
            greenLabel.trailingAnchor.constraint(equalTo: greenSlider.leadingAnchor),
            greenLabel.centerYAnchor.constraint(equalTo: greenSlider.centerYAnchor),
            
            greenSlider.topAnchor.constraint(equalTo: redSlider.bottomAnchor),
            greenSlider.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant:  -margin),
            greenSlider.widthAnchor.constraint(equalTo: greenLabel.widthAnchor, multiplier: 3),
            
            blueLabel.topAnchor.constraint(equalTo: greenLabel.bottomAnchor),
            blueLabel.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant:  margin),
            blueLabel.trailingAnchor.constraint(equalTo: blueSlider.leadingAnchor),
            blueLabel.centerYAnchor.constraint(equalTo: blueSlider.centerYAnchor),
            
            
            blueSlider.topAnchor.constraint(equalTo: greenSlider.bottomAnchor),
            blueSlider.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -margin),
            blueSlider.widthAnchor.constraint(equalTo: blueLabel.widthAnchor, multiplier: 3),
            
            alpha.topAnchor.constraint(equalTo: blueLabel.bottomAnchor),
            alpha.leadingAnchor.constraint(equalTo: guide.leadingAnchor,constant:  margin),
            alpha.trailingAnchor.constraint(equalTo: alphaSlider.leadingAnchor),
            alpha.centerYAnchor.constraint(equalTo: alphaSlider.centerYAnchor),
            
            alphaSlider.topAnchor.constraint(equalTo: blueSlider.bottomAnchor),
            alphaSlider.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -margin),
            alphaSlider.widthAnchor.constraint(equalTo: alpha.widthAnchor, multiplier: 3),
            
            button.topAnchor.constraint(equalTo: alphaSlider.bottomAnchor),
            button.centerXAnchor.constraint(equalTo: guide.centerXAnchor),
            //            button.bottomAnchor.constraint(equalTo: guide.centerYAnchor),
            button.widthAnchor.constraint(equalTo: alphaSlider.widthAnchor),
            button.heightAnchor.constraint(equalToConstant: 80),
            
            ])
    }
    
    
}


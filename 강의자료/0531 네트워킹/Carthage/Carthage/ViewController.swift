//
//  ViewController.swift
//  Carthage
//
//  Created by Daisy on 31/05/2019.
//  Copyright © 2019 고정아. All rights reserved.
//

import UIKit
import DynamicColor

class ViewController: UIViewController {

    @IBOutlet var circles: [UIView]!
    
    @IBOutlet weak var circleView1: UIView!
    
    @IBOutlet weak var circleView2: UIView!
    
    @IBOutlet weak var circleView3: UIView!
    
    @IBOutlet weak var ciecleView4: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let blue   = UIColor(hexString: "#3498db")
        let red    = UIColor(hexString: "#e74c3c")
        let yellow = UIColor(hexString: "#f1c40f")
        
        let gradient = DynamicGradient(colors: [blue, red, yellow])
        let labPalette = gradient.colorPalette(amount: 8, inColorSpace: .lab)
        circles.enumerated().forEach { $1.backgroundColor = labPalette[$0] }
        
        let color = DynamicColor(hexString: "#c0392b")
        circleView1.backgroundColor = color
        circleView2.backgroundColor = color.darkened()
        circleView3.backgroundColor = color.inverted()
        
        let mixedColor = color.mixed(withColor: .white)
        ciecleView4.backgroundColor = mixedColor
        
    }

    

}


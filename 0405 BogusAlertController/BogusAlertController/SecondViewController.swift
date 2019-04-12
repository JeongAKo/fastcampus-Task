//
//  SecondViewController.swift
//  BogusAlertController
//
//  Created by Daisy on 09/04/2019.
//  Copyright © 2019 고정아. All rights reserved.
//

protocol SecondVCDelegate: class {
    func sendColor(_ color:UIColor)
}

import UIKit

class SecondViewController: UIViewController {

    weak var delegate: SecondVCDelegate?

    @IBOutlet weak var yellowButton: UIButton!
    @IBOutlet weak var whiteButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func yelloeButtonAction(_ sender: UIButton) {
        
        delegate?.sendColor(.yellow)
    }
    @IBAction func whiteButton(_ sender: UIButton) {
        delegate?.sendColor(.white)
    }
    

}

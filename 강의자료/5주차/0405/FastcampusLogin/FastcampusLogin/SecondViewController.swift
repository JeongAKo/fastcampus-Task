//
//  SecondViewController.swift
//  FastcampusLogin
//
//  Created by Daisy on 05/04/2019.
//  Copyright © 2019 고정아. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    var 아이디 = ""
    
    @IBOutlet weak var idLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        outputLabelText()

        

    }
    func outputLabelText() {
        
        idLabel.text = ("\(아이디)님 환영합니다")
        
        
    }

}

//
//  SecondViewController.swift
//  storyboardSegue
//
//  Created by Daisy on 02/04/2019.
//  Copyright © 2019 고정아. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    var count = 0
    var minus = 0
    
    @IBOutlet weak var UITextField: UITextField!
    @IBOutlet weak var countLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

     countLabel.text = "\(count)"
    }
    
    @IBAction func editingChanged(_ sender: UITextField) {
        guard let number = Int(sender.text ?? "0") else {return}
        minus = number
    }
    
    
    @IBAction func unwindToSecond(_ unwindSegue: UIStoryboardSegue) {
    
        // Use data from the view controller which initiated the unwind segue
    }
    
}

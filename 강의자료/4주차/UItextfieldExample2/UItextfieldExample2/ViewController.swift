//
//  ViewController.swift
//  UItextfieldExample2
//
//  Created by Daisy on 26/03/2019.
//  Copyright © 2019 Daisy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstTextfield: UITextField!
    @IBOutlet weak var secondTextfield: UITextField!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        firstTextfield.becomeFirstResponder()
    }
    
    @IBAction func signin(_ sender: Any) {
//        firstTextfield.resignFirstResponder()
//        secondTextfield.resignFirstResponder()
        view.endEditing(true)
    }
   
 
    override func viewDidLoad() {
        super.viewDidLoad()
      
    }
    var tfTextBackUp = ""
    @IBAction func didEndExit(_ sender: Any) { print("-----didEndExit-----")
    }
    @IBAction func editingChanged(_ sender: UITextField) {
        
        guard var text = sender.text else { return }
        if text.count > 10 {
            sender.text = tfTextBackUp
        } else {
            tfTextBackUp = text
        }
        
        print("-----editingChanged-----")
        
        if sender == firstTextfield {
            print (sender.text?.count)
        } else if sender.tag == 2 {
            print (sender.text)
        } else if sender.tag == 3 {
            print (sender.text)
        }
        
        
    }
    @IBAction func didBegin(_ sender: Any) { print("-----didBegin-----")
    }
    
    @IBAction func didEnd(_ sender: Any) { print("-----didEnd-----")
    }
    @IBAction func actionTriggered(_ sender: Any) { print("-----actionTriggered-----")
    }
}


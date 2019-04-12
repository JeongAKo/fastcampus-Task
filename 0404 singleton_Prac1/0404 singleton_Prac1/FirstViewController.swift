//
//  ViewController.swift
//  0404 singleton_Prac1
//
//  Created by Daisy on 04/04/2019.
//  Copyright © 2019 고정아. All rights reserved.
//

import UIKit


class FirstViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    var singleton = Singleton.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let second = segue.destination as? SecondViewController,
            let text = textField.text else { return }
        
        singleton.text = text

        
//            textField.text = second.label.text
    }

//    @IBAction func save(_ sender: UIButton) {
//        let text = textField.text
//        UserDefaults.standard.set(text, forKey: "text")
//    }
    
    
    @IBAction func unwindToFirst(_ unwindSegue: UIStoryboardSegue) {

        textField.text = ""
    }

}


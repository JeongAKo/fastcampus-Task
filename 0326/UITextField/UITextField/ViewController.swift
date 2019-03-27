//
//  ViewController.swift
//  UITextField
//
//  Created by 고정아 on 26/03/2019.
//  Copyright © 2019 고정아. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var myTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    @IBAction func editingDidBegin(_ sender: Any) { //1
        print("editingDidBegin")
    }

    @IBAction func editingChanged(_ sender: UITextField) { //2
        guard let text = sender.text else {return}
        print(text)
        myLabel.text = text
        myLabel.font = UIFont.boldSystemFont(ofSize: 40)
        myLabel.textColor = .blue
    }
    @IBAction func didEndOnExit(_ sender: Any) {
        print("didEndOnExit")  //3
        //리턴키를 눌렀을 때 키보드를 내려주는 것
        myLabel.font = UIFont.boldSystemFont(ofSize: 20)
        myLabel.textColor = .red
        
    }

    @IBAction func primaryActionTriggered(_ sender: Any) {
        print("primaryActionTriggered")  //4
    }
    @IBAction func editingDidEnd(_ sender: Any) {
        print("editingDidEnd")  //5
    }
    
    


}


//
//  ViewController.swift
//  SingletonExample
//
//  Created by Wi on 10/04/2019.
//  Copyright © 2019 Wi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var passWord: UITextField!
    @IBOutlet weak var age: UITextField!
    @IBOutlet weak var phoneNumber: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        name.delegate = self
        passWord.delegate = self
        age.delegate = self
        phoneNumber.delegate = self
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let nametext = name.text else {return true}
        userData.singleton.name = nametext
        guard let passWordtext = passWord.text else {return true}
        userData.singleton.passWord = passWordtext
        guard let agetext = age.text else {return true}
         userData.singleton.age = agetext
        guard let phoneNumbertext = name.text else {return true}
        userData.singleton.phoneNumber = phoneNumbertext
        
        name.resignFirstResponder()
        passWord.resignFirstResponder()
        age.resignFirstResponder()
        phoneNumber.resignFirstResponder()
        
        return true
    }


}


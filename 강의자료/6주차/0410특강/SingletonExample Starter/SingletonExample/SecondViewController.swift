//
//  SecondViewController.swift
//  SingletonExample
//
//  Created by Daisy on 10/04/2019.
//  Copyright © 2019 Wi. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var passWordLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLabel.text = ("이름: \(userData.singleton.name)")
        passWordLabel.text = ("비밀번호: \(userData.singleton.passWord)")
        ageLabel.text = ("나이: \(userData.singleton.age)")
        phoneNumberLabel.text = ("핸드폰번호: \(userData.singleton.phoneNumber)")
    }
    


}

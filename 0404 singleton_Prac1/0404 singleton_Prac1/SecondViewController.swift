//
//  SecondViewController.swift
//  0404 singleton_Prac1
//
//  Created by Daisy on 04/04/2019.
//  Copyright © 2019 고정아. All rights reserved.
//

/*
 1.
 FirstVC 의 TextField 에 입력한 값을 SecondVC 의 Label에 표시하기
 - UserDefaults 를 이용한 방법으로 구현
 - Singleton 을 이용한 방법으로 구현
 - Delegate 를 이용한 방법으로 구현
 */


import UIKit

class SecondViewController: UIViewController {
   
    var singleton = Singleton.shared

    
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//
//       customUiLabel.delegate = self
//    }
//    func labelText(_ newText: String?) -> String {
//        guard let textValue
        
//        label.text =  UserDefaults.standard.string(forKey: "text")
//        singleton.value = 2
        label.text = singleton.text
    }
}

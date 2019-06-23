//
//  ViewController.swift
//  UItextfieldExample
//
//  Created by Daisy on 26/03/2019.
//  Copyright © 2019 Daisy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstTextField: UITextField!
    
    
    override func viewDidAppear(_ animated: Bool) { //앱 키자마자 키보드 나오게 하는것
        super.viewDidAppear(animated)
        firstTextField.becomeFirstResponder()
    }
    
    @IBAction private func signin(_ sender: Any) {  //signin버튼 누르면 키보드 내려가게 하는것
        firstTextField.resignFirstResponder()
//        view.endEditing(true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
      
    }

    @IBAction func didAndOnExit(_ sender: Any) {
        print("----------[didAndOnExit]----------")
    }
    @IBAction func didBegin(_ sender: Any) {
         print("----------[didBegin]----------")
    }
    
    var tfTextBackup = ""
    @IBAction func didChanged(_ sender: UITextField) {

        guard var text = sender.text else { return }
        if text.count > 10{
            //1번째 방법
//            text.removeLast()
//            sender.text = text //11번째 마지막 글자를 삭제하고 10번째 까지만
            
            //2번째방법
//            sender.deleteBackward()
            
            //3번째 방법
            sender.text = tfTextBackup
        }else {
            tfTextBackup = text
        }
//        if (sender.text?.count ?? 0) > 10 {
//        }
        
//       if let count = sender.text?.count  {
//            if count > 9 {
//            }
//        }
        print("----------[didChanged]----------")
        
        if sender == firstTextField {
            print(sender.text?.count)
        } else if sender.tag == 2 {
            print(sender.text)
        } else if sender.tag == 0 {
            print(sender.text?.count)
        }
    }
    @IBAction func didEnd(_ sender: Any) {
        print("----------[didEnd]----------")
    }
    @IBAction func actionTriggered(_ sender: Any) {
        print("----------[actionTriggered]----------")
    }
    
}


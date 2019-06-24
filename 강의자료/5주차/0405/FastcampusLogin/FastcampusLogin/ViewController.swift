//
//  ViewController.swift
//  FastcampusLogin
//
//  Created by Daisy on 05/04/2019.
//  Copyright © 2019 고정아. All rights reserved.
//

import UIKit

class Student {
    let id: String
    let password: String
    
    init(id: String, password: String) {
        self.id = id
        self.password = password
    }
}

class ViewController: UIViewController {
    
    let id = "acb"
    let pw = 123
    var popUpCheck = false
    var textState: Bool = false
    var colorState: Bool = true
    
    
    // 학생정보
    let student: [Student] = [
        Student(id: "qwer", password: "1234"),
        Student(id: "곰돌이1", password: "bear1"),
        Student(id: "희망이1", password: "dog1"),
    ]
    
    
    
    @IBOutlet weak var someView: UIView!
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    
    @IBOutlet weak var mailPic: UIImageView!
    @IBOutlet weak var lockPic: UIImageView!
    
    @IBAction func editingDidBegin(_ sender: Any) {
        
    }
    
    func test() {
        for i in 0..<student.count {
            if (idTextField.text == student[i].id) && (pwTextField.text == student[i].password) {
                
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        idTextField.delegate = self
        pwTextField.delegate = self
    

    }
    
    @IBAction func editingChanged(_ sender: UITextField) {
        
        guard var textLimit = sender.text else { return }
        
        if textLimit.count > 20 {
            sender.deleteBackward()
        } else if textLimit.count < 4 || textLimit.count > 16 {
            //            alert(title: "4 ~ 16자 사이의 값을 입력하세요")
            textState = false
        } else if textLimit.count > 4 || textLimit.count < 16 {
            //            alert(title: "4 ~ 16자 사이의 값을 입력하세요")
            textState = true
        }
    }
    
    @IBAction func pushSigninButton(_ sender: UIButton) {
        //        if textState {
        //            if (idTextField.text == student[0].id) && (pwTextField.text == student[0].password) {
        //            }
        changeColor()
        for i in 0..<student.count {
            if (idTextField.text == student[i].id) && (pwTextField.text == student[i].password) {
                
                colorState = false
                performSegue(withIdentifier: "넘어가", sender: self)
                
                break
                
            }
            
            if !textState {
                alert(title: "4 ~ 16자 사이의 값을 입력하세요")
            }
        }
        
    }
    
    func changeColor() {
        print("colorState: ",colorState)
        print(colorState)
        if colorState {
            print("running")
            
//            self.someView.backgroundColor = .red
            self.idTextField.backgroundColor = .red
            self.pwTextField.backgroundColor = .red
            UIView.animate(withDuration: 0.3) {
                print("running colors")
                
                self.idTextField.backgroundColor = .white
                self.someView.backgroundColor = .white
//                self.pwTextField.backgroundColor = .white
//                self.view.backgroundColor = .red
//                self.view.backgroundColor = .white
            }
            print("aready Run")
        }
    }
    
    // SecondView로 정보 넘기기
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        guard let secondVC = segue.destination as? SecondViewController else { return }
        
        guard let id = idTextField.text else { return }
        secondVC.아이디 = id
    }
    
    @IBAction func unwindToFirst(_ unwindSegue: UIStoryboardSegue) {
        colorState = true
        idTextField.text = nil
        pwTextField.text = nil
    }
}

extension ViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        guard popUpCheck  == false else { return }
        UIView.animate(withDuration: 0.32) {
            self.someView.frame.origin.y -= 150
            self.popUpCheck = true
        }
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        UIView.animate(withDuration: 0.32) {
            self.someView.frame.origin.y += 150
        }
        popUpCheck = false
        return true
    }
    
    func alert(title: String) {
        let alertcontroller = UIAlertController(title: title, message: "", preferredStyle: .alert)
        let alertOkAction = UIAlertAction(title: "확인", style: .default)
        alertcontroller.addAction(alertOkAction)
        present(alertcontroller, animated: true)
    }
    
}





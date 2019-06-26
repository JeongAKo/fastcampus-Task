//
//  ViewController.swift
//  calculator
//
//  Created by Daisy on 19/04/2019.
//  Copyright © 2019 고정아. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let firstlabel = UILabel()
    let secondlabel = UILabel()
    let thirdlabel = UILabel()

    let firstTextField = UITextField()
    let secondTextField = UITextField()
    let thirdTextField = UITextField()
    
    let comfirmButton = UIButton()
    let resultLabel = UILabel()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        settingView()
    }
    
    
    func settingView() {
        
        firstlabel.frame = CGRect(x: 30, y: 100, width: 100, height: 30)
        firstlabel.text = "피연산자1"
        firstlabel.textAlignment = .center
        
        secondlabel.frame = CGRect(x: 140, y: 100, width: 100, height: 30)
        secondlabel.text = "연산자"
        secondlabel.textAlignment = .center
        
        thirdlabel.frame = CGRect(x: 250, y: 100, width: 100, height: 30)
        thirdlabel.text = "피연산자2"
        thirdlabel.textAlignment = .center
        
        //피연산자1
        firstTextField.frame = CGRect(x: 30, y: 150, width: 100, height: 30)
        firstTextField.borderStyle = .line
        //연산자
        secondTextField.frame = CGRect(x: 140, y: 150, width: 100, height: 30)
        secondTextField.borderStyle = .line
        //피연산자2
        thirdTextField.frame = CGRect(x: 250, y: 150, width: 100, height: 30)
        thirdTextField.borderStyle = .line
        
        comfirmButton.frame = CGRect(x: view.frame.width/2 - 100 , y: 200, width: view.frame.width - 200, height: 40)
        comfirmButton.layer.cornerRadius = 15
        comfirmButton.setTitle("결과확인", for: .normal)
        comfirmButton.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
        comfirmButton.backgroundColor = .darkGray
        
        resultLabel.textAlignment = .center
        resultLabel.frame = CGRect(x: 140, y: 200, width: 100, height: 30)
        
        view.addSubview(firstlabel)
        view.addSubview(secondlabel)
        view.addSubview(thirdlabel)
        
        view.addSubview(firstTextField)
        view.addSubview(secondTextField)
        view.addSubview(thirdTextField)
        
        view.addSubview(comfirmButton)
        view.addSubview(resultLabel)
    }
    
    @objc func tapButton() {
        
        guard let 피연산자1 = firstTextField.text, let 피연산자2 = thirdTextField.text else { return }
        _ = Int(피연산자1)
        _ = Int(피연산자2)
        
//        enum Operator {
//            case +, -, *, %
        }
    
    let result: Double
    
        switch op {
        case :
            <#code#>
        default:
            <#code#>
        }
        

        
        
        
    }

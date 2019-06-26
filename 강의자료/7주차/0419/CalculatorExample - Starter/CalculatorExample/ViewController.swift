//
//  ViewController.swift
//  CalculatorExample
//
//  Created by giftbot on 17/04/2019.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var allClear: UIButton!
    @IBOutlet weak var equal: UIButton!
    @IBOutlet weak var divide: UIButton!
    @IBOutlet weak var multiple: UIButton!
    @IBOutlet weak var minus: UIButton!
    @IBOutlet weak var plus: UIButton!
    
    var count = 0
    var op: String? = nil
    var currentNum: Double = 0.0
    var pastNum: Double = 0.0
    var displayText: String? = nil
    
//    let formatter = NumberFormatter()
//    formatter.numberStyle = .decimal
//    formatter.minimumFractionDigits = 0
//    formatter.maximumFractionDigits = 3
//    let numString = formatter.string(from: number as NSNumber)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultLabel.text = "0"
    }
    
    @IBAction func tapNumButton(_ sender: UIButton) {
        if displayText == nil {
            displayText = (sender.titleLabel?.text)!
        } else {
            displayText? += (sender.titleLabel?.text)!
        }
        resultLabel.text = displayText
    }
    
    @IBAction func operateAction(_ sender: UIButton) {
            count = 0
        if resultLabel != nil {
            checkingOperation()
            op = sender.titleLabel?.text
            displayText = nil //이건 왜?
            if sender.titleLabel?.text == "=" {
                resultLabel.text = String(pastNum)
                count += 1
            }
        } else {
            op = sender.titleLabel?.text!
        }
    }
    
    @IBAction func allClear(_ sender: UIButton) {
        resultLabel.text = "0"
        op = nil
        currentNum = 0.0
        pastNum = 0.0
        displayText = nil
    }
    
    func checkingOperation() {
        if op == nil {
            pastNum = Double(displayText!)!
        } else {
            currentNum = Double(displayText!)!
            if op == "+" {
                pastNum += currentNum
            } else if op == "-" {
                pastNum -= currentNum
            } else if op == "×" {
                pastNum *= currentNum
            } else if  op == "÷" {
                pastNum /= currentNum
            }
            resultLabel.text = String(pastNum)
        }
    }
}

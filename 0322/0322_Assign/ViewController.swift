//
//  ViewController.swift
//  과제 0322
//
//  Created by Daisy on 22/03/2019.
//  Copyright © 2019 Daisy. All rights reserved.
//


//[ 과제 ]
//  01. UISwitch : On, Off 가 바뀔 때마다 Label 의 내용이 On, Off 로 표시되도록 구현
// 02. UISegmentedControl : 선택 내용이 바뀔 때마다 Label 의 내용도 해당 타이틀 값으로 함께 변경되도록 구현


import UIKit

  var click = true

class ViewController: UIViewController {

    @IBOutlet weak var changLabel: UILabel!
    @IBOutlet weak var onOff: UILabel!
    @IBOutlet weak var control: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        changLabel.text = "Zero"
    }
    
    @IBAction func `switch`(_ sender: Any) {
        
        if click == true
        {
            self.onOff.text = "Off"
            click = false
            
        }
        else if click == false {
            
            self.onOff.text = "On"
            
            click = true
        }
        
    }
    @IBAction func changeNum(_ sender: Any) {
        
        if(control.selectedSegmentIndex == 0)
        {
            changLabel.text = "First"
            changLabel.backgroundColor = .red
        }
        else if(control.selectedSegmentIndex == 1)
        {
            changLabel.text = "Second"
            changLabel.backgroundColor = .orange
        }
        else if(control.selectedSegmentIndex == 2)
        {
            changLabel.text = "Third"
            changLabel.backgroundColor = .yellow
        }
        else if(control.selectedSegmentIndex == 3)
        {
            changLabel.text = "Fourth"
            changLabel.backgroundColor = .green
        }
        
     
        
    }
}






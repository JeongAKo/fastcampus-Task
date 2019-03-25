//
//  ViewController.swift
//  alertController_task
//
//  Created by Daisy on 25/03/2019.
//  Copyright © 2019 Daisy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var count = 0 {
        willSet {
            label.text = String(newValue)
        }
    }
    
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func didTapButton(_ sender: Any) {
        let alertController = UIAlertController(title: "타이틀 ", message: "카운트 추가", preferredStyle: .actionSheet)
        
        let upAction = UIAlertAction(title: "up", style: .default) { _ in
            self.count += 1
//            self.label.text = String(self.count)
        }
        
        let cancleAction = UIAlertAction(title: "Cancle", style: .cancel, handler: nil
        )
        let voidAction = UIAlertAction(title: "Void", style: .destructive) { _ in
            print("Do nothig")
        }
        alertController.addAction(upAction)
        alertController.addAction(cancleAction)
        alertController.addAction(voidAction)
        
        present(alertController, animated: true)
        
    }
}




//
//  ViewController.swift
//  alertController_code
//
//  Created by Daisy on 25/03/2019.
//  Copyright © 2019 Daisy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var count = 0
    
    let button = UIButton(type: .system)
    let label = UILabel(frame: .init(x: 200, y: 200, width: 50, height: 50))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        button.frame = CGRect(x: 200 , y: 300, width: 50, height: 50)
        button.setTitle("버튼", for: .normal)
        button.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
        view.addSubview(button)
        
        label.text = "-"
        view.addSubview(label)
        
        
    }
    
    @objc func didTapButton(_ sender: Any) {
        let arletController = UIAlertController(title: nil , message: "Up 누르면 +1", preferredStyle: .alert)
        
        let upButton = UIAlertAction(title: "Up", style: .default) { _ in
            self.count += 1
            self.label.text = String(self.count)
            print(self.count)
        }
        let resetAction = UIAlertAction(title: "초기화", style: .default) { _ in
            self.count = 0
            self.label.text = "\(self.count)"
        }
        let cancleAction = UIAlertAction(title: "취소", style: .cancel) { _ in
            print("Cancle")
        }
        let 빼기 = UIAlertAction(title: "빼기", style: .destructive) { _ in
            self.count -= 1
            self.label.text = String(self.count)
        }
        
        arletController.addAction(upButton)
        arletController.addAction(cancleAction)
        arletController.addAction(빼기)
        arletController.addAction(resetAction)
        
        present(arletController, animated: true)
    }
}






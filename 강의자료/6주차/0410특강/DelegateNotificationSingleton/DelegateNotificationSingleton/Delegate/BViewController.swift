//
//  BViewController.swift
//  DelegateNotificationSingleton
//
//  Created by Wi on 09/04/2019.
//  Copyright © 2019 Wi. All rights reserved.
//

import UIKit

//직원

protocol BViewControllerDelegate: class {
    func text(text: String?)
}


class BViewController: UIViewController, TodoList {
    

    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var label: UILabel!
    
    weak var delegate : BViewControllerDelegate?
    
    var data: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = data
    }
    
    func textPresnt(_ text: String?) {
        data = text
    }
    @IBAction func toBossViewBtnDidTap(_ sender: Any) {
        delegate?.text(text: textField.text)
        dismiss(animated: true, completion: nil)
    }
    
    
}

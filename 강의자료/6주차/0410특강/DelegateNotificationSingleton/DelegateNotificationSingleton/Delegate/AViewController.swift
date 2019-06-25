//
//  AViewController.swift
//  DelegateNotificationSingleton
//
//  Created by Wi on 09/04/2019.
//  Copyright © 2019 Wi. All rights reserved.
//

import UIKit

//사장

protocol TodoList {
    func textPresnt(_ text: String?)
}

class AViewController: UIViewController, UITextFieldDelegate{
    
    var delegate: TodoList?
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let staffVC = segue.destination as? BViewController else {return}
        self.delegate = staffVC
        delegate?.textPresnt(textField.text)
        
        
        staffVC.delegate = self
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}

extension AViewController: BViewControllerDelegate {
    func text(text: String?){
        label.text = text
    }
    
    
}

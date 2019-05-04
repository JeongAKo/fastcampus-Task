//
//  ThirdViewController.swift
//  0430NotificationPrac
//
//  Created by Daisy on 03/05/2019.
//  Copyright © 2019 고정아. All rights reserved.

import UIKit

class ThirdViewController: UIViewController {
    
    let fourthVC = FourthViewController()
    let textField: UITextField = {
        let textFeild = UITextField()
        textFeild.translatesAutoresizingMaskIntoConstraints = false
        return textFeild
    }()
    
    let noti = NotificationCenter.default
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self  //resignFirstResponder() 를 써줄려면 델리게이트를 통해서 해주어야 한다. extension 하단에 해줘야함 지금은 불필요
    
        addsubView()
        configuration()
        autoLayout()
        fourthVC.addObserver()  //여기서 불러주기 때문에 뒤에서 불러줄 필요가 없다.(appDelegate에서 만들어 주지 않아서 여기서 사용 가능)
        
    }
    
    func configuration() {
        textField.layer.borderColor = UIColor.blue.cgColor
        textField.layer.borderWidth =  1
    }
 
    func addsubView() {
        view.addSubview(textField)
    }
    
    func autoLayout() {
        
        let guide = view.safeAreaLayoutGuide
        let margin: CGFloat = 20
        
        NSLayoutConstraint.activate([
            
            textField.topAnchor.constraint(equalTo: guide.topAnchor, constant: margin * 10),
            textField.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: margin),
            textField.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -margin),
            textField.heightAnchor.constraint(equalToConstant: 40),
            
            ])
        
    }
}

extension ThirdViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        let text = textField.text ?? ""
        
        noti.post(name: .textNoti, object: nil, userInfo: ["text": text])
        navigationController?.pushViewController(fourthVC, animated: true)
    
        return true
    
    }

}

//
//  FourthViewController.swift
//  0430NotificationPrac
//
//  Created by Daisy on 03/05/2019.
//  Copyright © 2019 고정아. All rights reserved.
//

import UIKit

extension Notification.Name {
    static let textNoti = Notification.Name("textNoti")    
}

class FourthViewController: UIViewController {

    let custonLebel: UILabel = {
        let customLebel = UILabel()
        customLebel.translatesAutoresizingMaskIntoConstraints = false
        return customLebel
    }()
    
    let noti = NotificationCenter.default
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configuration()
        addsubView() //오토레이아웃 전에 해야 한다 *순서 주의*
        autoLayout()
    }
    
    func configuration() {
        custonLebel.backgroundColor = #colorLiteral(red: 0.6693086028, green: 0.4839866161, blue: 0.9111648202, alpha: 1)
    }
    
    func autoLayout() {
    
        let guide = view.safeAreaLayoutGuide
        let margin:CGFloat = 20

        NSLayoutConstraint.activate([
            
            custonLebel.topAnchor.constraint(equalTo: guide.topAnchor, constant: margin * 10),
            custonLebel.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: margin),
            custonLebel.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -margin),
            custonLebel.heightAnchor.constraint(equalToConstant: 40),
            
            ])
    }
    
    func addsubView() {
    view.addSubview(custonLebel)
    }
    
    func addObserver() {
        noti.addObserver(
            self,
            selector: #selector(selectorSetting(_:)),
            name: .textNoti,
            object: nil
        )
        print("addObserver")
    }
    
    @objc func selectorSetting(_ sender: Notification) {
        //[Hashable: Any] => [String: String]
        guard let typeChange = sender.userInfo as? [String: String] else { return }
        custonLebel.text = typeChange["text"]
        
        print("selectorSetting")
    }
    
    deinit {
        removeObserver()
    }

    func removeObserver() {
        noti.removeObserver(self)
    }
}

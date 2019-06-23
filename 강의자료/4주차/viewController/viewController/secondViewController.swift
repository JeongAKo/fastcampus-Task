//
//  secondViewController.swift
//  viewController
//
//  Created by Daisy on 26/03/2019.
//  Copyright © 2019 Daisy. All rights reserved.
//

import UIKit

class secondViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("----------------[secondviewDidLoad]----------------")
        view.backgroundColor = .blue
        
        let button = UIButton(type: .system)
        button.frame = CGRect(x: 100, y: 100, width: 80, height: 40 )
        button.addTarget(self, action: #selector(dismisstfirstVC), for: .touchUpInside)
        button.setTitle("프레젠트", for: .normal)
        button.setTitleColor(.white, for: .normal)
        
        view.addSubview(button)
    }
    
    @objc func dismisstfirstVC(){
        
//        presentingViewController?.dismiss(animated: true)
        
        print(presentedViewController)  //내가 지금 띄운 VC
        print(presentingViewController) //나를 띄우게 만든 VC
      
        if let vc = presentingViewController as? ViewController {
            print(vc.data)
        }
    
//        dismiss(animated: true)
//
//        let firstVC = ViewController()    이렇게 하면 위에 계속 중첩이 된다
//        present(firstVC, animated: true)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("----------------[secondvieWillapear]----------------")
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("----------------[secondviewDidAppear]----------------")
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("----------------[secondviewWillDisappear]----------------")
    }
    
    deinit {
        print("second Deinit")
        
    }
    
}


/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destination.
 // Pass the selected object to the new view controller.
 }
 */



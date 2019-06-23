//
//  secondViewController.swift
//  ViewController_Prac
//
//  Created by Daisy on 26/03/2019.
//  Copyright © 2019 Daisy. All rights reserved.
//

import UIKit

class secondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .orange
        
        let firstButton = UIButton(type: .system)
        firstButton.frame = CGRect(x: 100, y: 100, width: 80, height: 40)
        firstButton.addTarget(self, action: #selector(presentFirstVC), for: .touchUpInside)
        firstButton.setTitle("First", for: .normal)
        firstButton.setTitleColor(.red, for: .normal)
        
        let thirdButton = UIButton(type: .system)
        thirdButton.frame = CGRect(x: 100, y: 200, width: 80, height: 40)
        thirdButton.addTarget(self, action: #selector(presentThirdVC), for: .touchUpInside)
        thirdButton.setTitle("Third", for: .normal)
        thirdButton.setTitleColor(.blue, for: .normal)
        
        let dismissButton = UIButton(type: .system)
        dismissButton.frame = CGRect(x: 100, y: 300, width: 80, height: 40)
        dismissButton.addTarget(self, action: #selector(dismissVC), for: .touchUpInside)
        dismissButton.setTitle("Dismiss", for: .normal)
        dismissButton.setTitleColor(.black, for: .normal)
        
        view.addSubview(firstButton)
        view.addSubview(thirdButton)
        view.addSubview(dismissButton)
        
    }
    
        
    @objc func presentFirstVC() {
        let firstVC = ViewController()
        present(firstVC, animated: true)
    }
    
    @objc func presentThirdVC() {
        let thirdVC = thirdViewController()
        present(thirdVC, animated: true)
    }
    @objc func dismissVC() {
        presentingViewController?.dismiss(animated: true)
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



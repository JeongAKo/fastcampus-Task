//
//  ViewController.swift
//  BogusAlertController
//
//  Created by Daisy on 09/04/2019.
//  Copyright © 2019 고정아. All rights reserved.
//

import UIKit


class FirstViewController: UIViewController {


    let alertButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createButton()
    }

    func createButton() {
//        var safeX = view.safeAreaInsets.left + view.safeAreaInsets.right
//        var safeY = view.safeAreaInsets.top + view.safeAreaInsets.bottom
    
       alertButton.frame = CGRect(x: view.frame.width - 310, y: 407, width: view.frame.width - 200, height: 60)
        alertButton.backgroundColor = .gray
        alertButton.setTitle("Alert", for: .normal)
        alertButton.setTitleColor(.white, for: .normal)
        alertButton.layer.cornerRadius = 20
        alertButton.addTarget(self, action: #selector(presentSecondVC(_:)), for: .touchUpInside)
        
        
        view.addSubview(alertButton)
    }
    
    
    @objc func presentSecondVC(_ sender: UIButton) {

        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        guard let secondVC = storyBoard.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController else {return}
            secondVC.modalPresentationStyle = .overCurrentContext
        secondVC.delegate = self
        present(secondVC, animated: true)
    }
    
    @IBAction func unwindToFirst(_ unwindSegue: UIStoryboardSegue) {
               
    }

}

extension FirstViewController: SecondVCDelegate {
    func sendColor(_ color: UIColor) {
        view.backgroundColor = color
    }
}

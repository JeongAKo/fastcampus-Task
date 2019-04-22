//
//  DetailContactsVC.swift
//  ContactsTableView
//
//  Created by Daisy on 16/04/2019.
//  Copyright © 2019 고정아. All rights reserved.

import UIKit

class DetailContactsVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    let imageView = UIImageView()
    let nameLabel = UILabel()
    let nameLabel2 = UILabel()
    
    let numberLabel = UILabel()
    let numberLabel2 = UILabel()
    
    var xButton1 : UIImage = UIImage(named: "xbutton")!
    
    @IBOutlet weak var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        makeLabels()
        backButton1()
  }
    
//    func makeImage() {
//        imageView.frame = CGRect(x: 200, y: 200, width: 100, height: 100)
//        imageView.image = UIImage(named:"user.png")
//        view.addSubview(imageView)
//    }
    
    func backButton1() {
        let backButton1 = UIButton()
        backButton1.setImage(xButton1, for: UIControl.State.normal)
        backButton1.frame = CGRect(x: 30, y: 60, width: 30, height: 30)
        backButton1.addTarget(self, action: #selector(dis1(_:)), for: .touchUpInside)
        view.addSubview(backButton1)
    }
    
    func makeLabels() {
        nameLabel2.frame = CGRect(x: 25, y: 450, width: 70, height: 40)
        nameLabel2.text = "이       름 :"
        nameLabel2.textAlignment = .right
        
        nameLabel.frame = CGRect(x: 100, y: 450, width: 280, height: 40)
        nameLabel.backgroundColor = .lightGray
        
        numberLabel2.frame = CGRect(x: 25, y: 550, width: 70, height: 40)
        numberLabel2.text = "전화번호 :"
        numberLabel2.textAlignment = .right
        
        numberLabel.frame = CGRect(x: 100, y: 550, width: 280, height: 40)
        numberLabel.backgroundColor = .lightGray
        
        
        view.addSubview(numberLabel)
        view.addSubview(nameLabel)
        view.addSubview(numberLabel2)
        view.addSubview(nameLabel2)
        
    }
    
    @objc func dis1(_ sender: UIButton) {
        
        presentingViewController?.dismiss(animated: true)
        
    }
    
    @IBAction func pick(_ sender: Any) {
        
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        picker.delegate = self
        
        self.present(picker, animated: false)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: false)
        
        self.dismiss(animated: false) { () in
            
            let alert = UIAlertController(title: "", message: "이미지 선택이 취소되었습니다", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "확인", style: .cancel))
            
            self.present(alert, animated:  false)
    
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: false) { () in
            let img = info[UIImagePickerController.InfoKey.editedImage] as? UIImage
            self.imgView.image = img

        }
    }
}

extension DetailContactsVC: ViewControllerDelegate {
    func tossInformation(_ name: String, _ number: String) {
        nameLabel.text = "  \(name)"
        numberLabel.text = "  \(number)"
    }
}

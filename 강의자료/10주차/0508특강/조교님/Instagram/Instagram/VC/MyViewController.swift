//
//  MyViewController.swift
//  Instagram
//
//  Created by Wi on 03/05/2019.
//  Copyright © 2019 Wi. All rights reserved.
//

import UIKit


// 마이페이지
class MyViewController: UITableViewController {
    
    
    let userManger = UserManager.shard
    let picker = UIImagePickerController()
    var user: User?// user
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    override func viewWillAppear(_ animated: Bool) {
        userManger.getUserInfo{ [weak self] user in
            self?.user = user
        }
        tableView.reloadData()
        self.title = user?.userName
    }
    
    
    
    // MARK: Configure
    
    func configure(){
        userManger.getUserInfo{ [weak self] user in
            self?.user = user
        }
        self.title = user?.userName
        
        // imagePicker
        picker.delegate = self
        
        
        // noti
        NotificationCenter.default.addObserver(self, selector: #selector(nickNameChange), name: Notification.Name("nickNameChange"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(profileImageChange), name: Notification.Name("profileImageView"), object: nil)
        
        // tableView
        tableView.register(UINib(nibName: "MyViewTableViewCell", bundle: nil), forCellReuseIdentifier: "myView")
        tableView.separatorColor = .clear
        
    }
    
    // MARK: TableView
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myView", for: indexPath) as! MyViewTableViewCell
        cell.selectionStyle = .none
        cell.model = user
        return cell
    }
    
    // MARK: Action
    
    // 2
    @objc private func nickNameChange(_ sender: Notification){
        guard let nickname = sender.userInfo?["nickName"] as? String else {return}
        userManger.changeUserName(userName: nickname) {[weak self] in
            if $0 {
                self?.createOkAlert(title: "닉네임 변경성공", message: "변경된 닉네임: " + $1)
                return
            }
            self?.createOkAlert(title: "닉네임 중복", message: $1)
        }
    }
    // 1
    @objc private func profileImageChange(_ sender: Notification){
        createSheetAlert(title: "이미지 선택", message: "")
    }
    
    // MARK: other func
    // 2
    private func createOkAlert(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default){ [weak self] _ in
            self?.userManger.getUserInfo{ [weak self] user in
                self?.user = user
            }
        }
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    // 1
    private func createSheetAlert(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        let cameraAction = UIAlertAction(title: "카메라로 찍기", style: .default) { [weak self] _ in
            self?.picker.sourceType = .camera
            self?.present(self!.picker, animated: true, completion: nil)
        }
        let libraryAction = UIAlertAction(title: "앨범에서 가져오기", style: .default) { [weak self] _ in
            self?.picker.sourceType = .photoLibrary
            self?.present(self!.picker, animated: true, completion: nil)
        }
        let cancelAction = UIAlertAction(title: "닫기", style: .cancel, handler: nil)
        
        alert.addAction(cameraAction)
        alert.addAction(libraryAction)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
        
    }
}

// MARK: - UIImagePicker

extension MyViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    // 3
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        user?.profileImage = info[.originalImage] as? UIImage
        userManger.changeUserInfo(user: user!) {
            user = $0
        }
        tableView.reloadData()
        picker.dismiss(animated: true, completion: nil)
    }
}

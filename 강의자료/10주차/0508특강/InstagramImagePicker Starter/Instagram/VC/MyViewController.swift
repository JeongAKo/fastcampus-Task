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
    
    
    let picker = UIImagePickerController()
    var user: User?
    let userManager = UserManager.shared
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    override func viewWillAppear(_ animated: Bool) {
        userManager.getUserInfo { [weak self] in
            self?.user = $0
        }
        tableView.reloadData()
        
    }
    
    
    
    // MARK: Configure
    
    func configure(){
        
        userManager.getUserInfo{ [weak self] user in
            self?.user = user
        }
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
        // 미리 만들어둔 셀
        let cell = tableView.dequeueReusableCell(withIdentifier: "myView", for: indexPath) as! MyViewTableViewCell
        cell.model = user
        cell.selectionStyle = .none
        
        return cell
    }
    
    // MARK: Action
    // 닉네임 수정버튼이 눌렸을때 불릴 함수
    @objc private func nickNameChange(_ sender: Notification){
        guard let nickname = sender.userInfo?["nickName"] as? String else {return}
        
        userManager.changUserName(userName: nickname) { [weak self]
            in
            if $0{
                self?.createOkAlert(title: "닉네임 변경 성공!", message: "변경된 닉네임: " + $1)
                    return
            }
            self?.createOkAlert(title: "닉네임 중복", message: $1)
        }
    }
    // 프로필 이미지뷰를 눌렀을때 불릴 함수
    @objc private func profileImageChange(_ sender: Notification){
        
        createSheetAlert(title: "이미지 선택", message: "")
        
    }
    
    // MARK: other func
    // 2
    private func createOkAlert(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) {
            [weak self] _ in
            self?.userManager.getUserInfo(completion: { user in
                self?.user = user
            })
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    // 1
    private func createSheetAlert(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        let cameraAtion = UIAlertAction(title: "카메라로 찍기", style: .default) { [weak self]_ in
            self?.picker.sourceType = .camera
            self?.present(self!.picker, animated: true, completion: nil)
        }
        let libraryAction = UIAlertAction(title: "앨범에서 가져오기", style: .default) { [weak self]_ in
            self?.picker.sourceType = .photoLibrary
            self?.present(self!.picker, animated: true, completion: nil)
        }
        let cancelAction = UIAlertAction(title: "닫기", style: .cancel, handler: nil)
        
        alert.addAction(cameraAtion)
        alert.addAction(libraryAction)
        alert.addAction(cancelAction)
        present(alert, animated:  true)
    }
}

// MARK: - UIImagePicker

extension MyViewController:  UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        user?.profileImage = info[.originalImage] as? UIImage
        userManager.changeUserInfo(user: user!) { (user) in
            self.user = user
        }
        tableView.reloadData()
        picker.dismiss(animated: true, completion: nil)
    }
}

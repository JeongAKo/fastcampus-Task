//
//  ViewController.swift
//  FirebasePrac
//
//  Created by Daisy on 20/07/2019.
//  Copyright © 2019 고정아. All rights reserved.
//

import UIKit
//import SnapKit
import Firebase
import FirebaseAnalytics
import FirebaseDatabase


class EnterViewController: UIViewController {
  var ref: DatabaseReference!
  var remoteConfig: RemoteConfig!
  
  var helloTextLabel = UILabel()
  let nameTextField = UITextField()
  let birthdayTextField = UITextField()
  let emailTextField = UITextField()
  
  var statusLabel = UILabel()
  let enterButton = UIButton()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.ref = Database.database().reference()
    remoteConfigSetting()
   
    addsubView()
    config()
    autoLayout()
    
  }
  
  func addsubView() {
    view.addSubview(helloTextLabel)
    view.addSubview(nameTextField)
    view.addSubview(birthdayTextField)
    view.addSubview(emailTextField)
    view.addSubview(statusLabel)
    view.addSubview(enterButton)
    
  }

  func config() {
    helloTextLabel.text = "Hello"
    helloTextLabel.font = UIFont.boldSystemFont(ofSize: 20)
    helloTextLabel.textAlignment = .center
    
    nameTextField.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    nameTextField.placeholder = "  이름(필수)"
    
    birthdayTextField.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    birthdayTextField.placeholder = "  생년월일(선택)"
    
    emailTextField.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    emailTextField.placeholder = "  이메일(필수)"
    
    statusLabel.backgroundColor = .yellow
    
    enterButton.backgroundColor = .darkGray
    enterButton.setTitle("입력하기", for: .normal)
    enterButton.addTarget(self, action: #selector(enterButtonTapped), for: .touchUpInside)
    
  }
  
  @objc func enterButtonTapped() {
    self.saveUserInfo()
    
  }
  
  private func saveUserInfo() {
    //MARK: Firebase Database에 새로운 내용을 입력합니다.
    guard let name = nameTextField.text,
      let email = emailTextField.text else {
        return
    }
    let birthday = birthdayTextField.text ?? ""
    
    let userInfo = [
      "name": name,
      "birthday": birthday,
      "email": email
    ]
    
    self.ref
      .child("users")
      .childByAutoId()
      .setValue(userInfo) { [weak self] error, _ in
        if let `error` = error {
          presentAlert(base: self, type: .submitFailed(error: error))
        } else {
          self?.statusLabel.text = "데이터가 성공적으로 저장되었습니다."
        }
    }
  }
  
  func autoLayout() {
    
    helloTextLabel.snp.makeConstraints { make in
      make.top.equalToSuperview().inset(100)
      make.leading.trailing.equalToSuperview().inset(30)
      make.width.equalToSuperview().multipliedBy(0.8)
      make.height.equalTo(30)
      make.centerX.equalToSuperview()
    }
    
    nameTextField.snp.makeConstraints { make in
      make.top.equalTo(helloTextLabel.snp.bottom).offset(20)
      make.leading.trailing.equalToSuperview().inset(30)
      make.width.equalToSuperview().multipliedBy(0.8)
      make.height.equalTo(30)
      make.centerX.equalToSuperview()
    }
    
    birthdayTextField.snp.makeConstraints { make in
      make.top.equalTo(nameTextField.snp.bottom).offset(20)
      make.leading.trailing.equalToSuperview().inset(30)
      make.width.equalToSuperview().multipliedBy(0.8)
      make.height.equalTo(30)
      make.centerX.equalToSuperview()
    }
    
    emailTextField.snp.makeConstraints { make in
      make.top.equalTo(birthdayTextField.snp.bottom).offset(20)
      make.leading.trailing.equalToSuperview().inset(30)
      make.width.equalToSuperview().multipliedBy(0.8)
      make.height.equalTo(30)
      make.centerX.equalToSuperview()
    }
    
    enterButton.snp.makeConstraints { make in
      make.top.equalTo(emailTextField.snp.bottom).offset(100)
      make.leading.trailing.equalToSuperview().inset(30)
      make.width.equalToSuperview().multipliedBy(0.8)
      make.height.equalTo(30)
      make.centerX.equalToSuperview()
    }
    
  }

}

extension EnterViewController: UITextFieldDelegate {

  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    self.view.endEditing(true)
    return false
  }
}

extension EnterViewController {
  private func remoteConfigSetting() {
    self.remoteConfig = RemoteConfig.remoteConfig()
    let settings = RemoteConfigSettings()
    remoteConfig.configSettings = settings
    
  }
  
}

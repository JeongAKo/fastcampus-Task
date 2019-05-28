//
//  ThirdViewController.swift
//  SlackNewWorkspace
//
//  Created by Daisy on 16/05/2019.
//  Copyright © 2019 giftbot. All rights reserved.
//

import AudioToolbox.AudioServices
import UIKit

class ThirdViewController: UIViewController {

    private let nextButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("Next", for: .normal)
        button.setTitleColor(.lightGray, for: .normal)
//        button.setTitleColor(.init(red: 18/255, green: 90/255, blue: 153/255, alpha: 1.0), for: .selected)
        button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        button.addTarget(self, action: #selector(didTapNextButton(_:)), for: .touchUpInside)
        return button
    }()
    
    private let closeButton: UIButton = {
        let button = UIButton(type: .custom)
        let closeButtonImage = UIImage(named: "btnBack")
        button.setImage(closeButtonImage, for: .normal)
        button.addTarget(self, action: #selector(didTapCloseButton(_:)), for: .touchUpInside)
        
        return button
    }()
    
     let wsNameTextField: UITextField = {
    let textField = UITextField()
        textField.font = UIFont.systemFont(ofSize: 22, weight: .light)
        textField.enablesReturnKeyAutomatically = true
        textField.borderStyle = .none
        textField.returnKeyType = .go
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
    return textField
    }()
    
    private let floatingLabel: UILabel = {
        let label = UILabel()
        label.text = "Get a URL (Letter, Numbers, and dashes only"
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        return label
    }()
    
    private let slackLabel: UILabel = {
        let label = UILabel()
        label.text = ".Slcak.com"
        label.font = UIFont.systemFont(ofSize: 18, weight: .light)
        label.textColor = .gray
        return label
    }()
    
    private let bottomLabel: UILabel = {
        let label = UILabel()
        label.text = "This is the adress that you'll use to sign in to Slack"
        label.font = UIFont.systemFont(ofSize: 12, weight: .light)
        return label
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        wsNameTextField.becomeFirstResponder()
        
    }
    
    private var slackLabelConst: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
        
    }
    
    private func setupView() {
        view.backgroundColor = .white
        view.addSubviews([nextButton, closeButton ])
        view.addSubviews([wsNameTextField, floatingLabel, bottomLabel, slackLabel])
        
        navigationController?.navigationBar.isHidden = true
        wsNameTextField.delegate = self
    }
    
    private func setupConstraints() {
        nextButton.layout.top().trailing(constant: -16)
        closeButton.layout.leading(constant: 16).centerY(equalTo: nextButton.centerYAnchor)
        
        wsNameTextField.layout.leading(constant: 16).trailing(constant: -16).centerY(constant: -115)
        
        
        floatingLabel.layout.leading(equalTo: wsNameTextField.leadingAnchor).trailing(equalTo: wsNameTextField.trailingAnchor).centerY(constant: -140)
        
        bottomLabel.layout.leading(equalTo: wsNameTextField.leadingAnchor).centerY(equalTo: wsNameTextField.bottomAnchor, constant: 100)
        slackLabel.layout.centerY(equalTo: wsNameTextField.centerYAnchor)
        
        slackLabelConst = slackLabel.leadingAnchor.constraint(equalTo: wsNameTextField.leadingAnchor)
        slackLabelConst.isActive = true
        
        guard let text = wsNameTextField.text else { return }
        let textSize = (text as NSString).size(withAttributes: [.font: wsNameTextField.font!])
        slackLabelConst.constant = textSize.width + 8
      
        
        
    }
    
    private func vibration() {
        
    }
    
    @objc func didTapNextButton(_ sender: UIButton) {
        guard nextButton.isSelected, let text = wsNameTextField.text else{return vibration()}
 
    }
    
    
    @objc func didTapCloseButton(_ senfer: UIButton) {
    
        self.navigationController?.popViewController(animated: true)
    }
}


extension ThirdViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        didTapNextButton(nextButton)
        return true
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let text = textField.text ?? ""
        let textSize = (text as NSString).size(withAttributes: [.font: wsNameTextField.font!])
        slackLabelConst.constant = textSize.width + 8
        
        
        
        return true
    }

}



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
        let attrString = NSAttributedString(string: "Get a URL (Letter, Numbers, and dashes only)", attributes: [.foregroundColor: UIColor.darkText.withAlphaComponent(0.5)]
        )
        textField.attributedPlaceholder = attrString
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
        label.text = "slack.com"
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        label.alpha = 0
        return label
    }()
    
    private let bottomLabel: UILabel = {
        let label = UILabel()
        label.text = "This is the adress that you'll use to sign in to Slack"
        label.font = UIFont.systemFont(ofSize: 10, weight: .light)
        return label
    }()
    
    // TODO: - activityIndicatorView 만들어야 하낭??
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        wsNameTextField.becomeFirstResponder()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
    }
    
    private func setupView() {
        view.backgroundColor = .white
        view.addSubviews([nextButton, closeButton ])
        view.addSubviews([wsNameTextField, floatingLabel, bottomLabel])
        
        navigationController?.navigationBar.isHidden = true
        wsNameTextField.delegate = self
    }
    
    private func setupConstraints() {
        nextButton.layout.top().trailing(constant: -16)
        closeButton.layout.leading(constant: 16).centerY(equalTo: nextButton.centerYAnchor)
        
        wsNameTextField.layout.leading(constant: 16).trailing(constant: -16).centerY(constant: -115)
        
        
        floatingLabel.layout.leading(equalTo: wsNameTextField.leadingAnchor).trailing(equalTo: wsNameTextField.trailingAnchor).centerY(constant: -115)
        
        bottomLabel.layout.leading(equalTo: wsNameTextField.leadingAnchor).trailing(equalTo: wsNameTextField.trailingAnchor).centerY(constant: 140)
        
    }
    
    private func vibration() {
        
    }
    
    @objc func didTapNextButton(_ sender: UIButton) {
        guard nextButton.isSelected, let text = wsNameTextField.text else{return vibration()}
        guard !
        
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
}

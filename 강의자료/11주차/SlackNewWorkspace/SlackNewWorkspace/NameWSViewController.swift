//
//  NameWSViewController.swift
//  SlackNewWorkspace
//
//  Created by giftbot on 16/05/2019.
//  Copyright © 2019 giftbot. All rights reserved.
//

import AudioToolbox.AudioServices
import UIKit

class NameWSViewController: UIViewController {
    
    private let nextButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("Next", for: .normal)
        button.setTitleColor(.lightGray, for: .normal)
            button.setTitleColor(.init(red: 18/255, green: 90/255, blue: 153/255, alpha: 1.0), for: .selected)
        button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        button.addTarget(self, action: #selector(didTapNextButton(_:)), for: .touchUpInside)
        return button
    }()
    
    private let closeButton: UIButton = {
        let button = UIButton(type: .custom)
        let closeImage = UIImage(named: "btnClose")!
        button.setImage(closeImage, for: .normal)
        button.addTarget(self, action: #selector(didTapCloseButton(_:)), for: .touchUpInside)
        return button
    }()
    
    private let wsNameTextField: UITextField = {
        let textField = UITextField()
        let attrString = NSAttributedString(
            string: "Name your workspace",
            attributes: [.foregroundColor: UIColor.darkText.withAlphaComponent(0.5)]
        )
        textField.attributedPlaceholder = attrString
        textField.font = UIFont.systemFont(ofSize: 22, weight: .light)
        textField.enablesReturnKeyAutomatically = true
        textField.borderStyle = .none
        textField.returnKeyType = .go
        textField.autocorrectionType = .no //자동완성 지우기
        textField.autocapitalizationType = .none //첫문자 대문자 안되게 막기
        return textField
    }()
    
    private let floatingLabel: UILabel = {
        let label = UILabel()
        label.text = "Name your Workspace"
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        label.alpha = 0
        return label
    }()
    private let activityIndicatorView: UIActivityIndicatorView = {
        let indicatorView = UIActivityIndicatorView(style: .gray)
        indicatorView.hidesWhenStopped = true
        return indicatorView
    }()
    private var indicatorViewLeadingConst: NSLayoutConstraint!
    
    private var floatingCenterYConst :NSLayoutConstraint!
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        wsNameTextField.becomeFirstResponder()
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        view.addSubviews([nextButton, closeButton])
        view.addSubviews([wsNameTextField, floatingLabel, activityIndicatorView])
        
        
        navigationController?.navigationBar.isHidden = true
        wsNameTextField.delegate = self
    }
    
    private func setupConstraints() {
        nextButton.layout.top().trailing(constant: -16)
        closeButton.layout
            .leading(constant: 16)
            .centerY(equalTo: nextButton.centerYAnchor) // extension 으로 확줄여서 쓴 코드
        wsNameTextField.layout
            .leading(constant: 16)
            .trailing(constant: -16)
            .centerY(constant: -115)
        
        floatingLabel.layout
            .leading(equalTo: wsNameTextField.leadingAnchor)
        let defaultCenterYConst = floatingLabel.centerYAnchor
            .constraint(equalTo: wsNameTextField.centerYAnchor)
        defaultCenterYConst.priority = UILayoutPriority(500)
        defaultCenterYConst.isActive = true
        
        floatingCenterYConst = floatingLabel.centerYAnchor
            .constraint(equalTo: wsNameTextField.centerYAnchor, constant: -30)
        floatingCenterYConst.priority = .defaultLow
        floatingCenterYConst.isActive = true
     
        activityIndicatorView.layout.centerY(equalTo: wsNameTextField.centerYAnchor)
    
        
        
        indicatorViewLeadingConst = activityIndicatorView.leadingAnchor.constraint(equalTo: wsNameTextField.leadingAnchor)
        indicatorViewLeadingConst.isActive = true
        
    }
    
    private func vibration() {
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
    }
    
    @objc func didTapNextButton(_ sender: UIButton) {
        guard nextButton.isSelected, let text = wsNameTextField.text
            else { return vibration() }
       
        guard !activityIndicatorView.isAnimating else { return }
        let textSize = (text as NSString).size(withAttributes: [.font: wsNameTextField.font!])
        indicatorViewLeadingConst.constant = textSize.width + 8
        activityIndicatorView.startAnimating()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.activityIndicatorView.stopAnimating()
            
            // 1. 다음 뷰컨트롤러 띄우는 코드
            let vc = ThirdViewController()
            self.show(vc, sender: nil)
            
            // 2. text를 다음뷰 컨트롤러한테 넘기기
            vc.wsNameTextField.text = self.wsNameTextField.text
            
        }
        print(text)
    }
    
    @objc func didTapCloseButton(_ sender: UIButton) {
        dismiss(animated: true)
    }
}


// MARK: - UITextFieldDelegate

extension NameWSViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        didTapNextButton(nextButton)
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let text = textField.text ?? ""
        let replacedText = (text as NSString).replacingCharacters(in: range, with: string)
        nextButton.isSelected = !replacedText.isEmpty
        
        UIView.animate(withDuration: 0.3, delay: 0, options: [.curveEaseInOut], animations: {
            if replacedText.isEmpty {
                self.floatingCenterYConst.priority = .defaultLow
                self.floatingLabel.alpha = 0.0
            } else {
                self.floatingCenterYConst.priority = .defaultHigh
                self.floatingLabel.alpha = 1.0
            }
            self.view.layoutIfNeeded() // 애니메이션주는곳 내부에서 변화를 주었는데 업데이트 되는 시점이 언제가 되는지 정확히 몰라서 애니메이션이 적용되는 블록 내에서 쓰면 "즉시 적용시켜라" 라는 의미
            
            //          self.view.setNeedsLayout() // true, false
        })
        
        return true
    }
}


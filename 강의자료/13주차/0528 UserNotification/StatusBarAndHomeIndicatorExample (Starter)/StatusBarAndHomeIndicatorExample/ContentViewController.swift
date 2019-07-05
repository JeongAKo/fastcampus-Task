//
//  ContentViewController.swift
//  StatusBarAndHomeIndicatorExample
//
//  Created by giftbot on 2019. 5. 28..
//  Copyright © 2019년 giftbot. All rights reserved.
//

import UIKit

final class ContentViewController: UIViewController {
  
  private var statusBarStyle = UIStatusBarStyle.default
  private var isStatusBarHidden = false
  private var isHomeIndicatorAutoHidden = false
  
  // MARK: StatusBar
  override var preferredStatusBarStyle: UIStatusBarStyle {
    return  statusBarStyle //.lightContent
  }
  
  override var prefersStatusBarHidden: Bool {
    return isStatusBarHidden
    
  }
  
  override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation {
    // slide, fade(default), none
    return .fade //.none //.slide
  }
  
    
  // MARK: HomeIndicator
  override var prefersHomeIndicatorAutoHidden: Bool {
    return isHomeIndicatorAutoHidden
  }
  
  
  // MARK: Action Handler
  @IBAction private func toggleStatusBarStyle(_ sender: Any) {
    let isDefault = statusBarStyle == .default
    
    statusBarStyle = isDefault ? .lightContent : .default // 반대로 togle
    
    UIView.animate(withDuration: 0.5) {
      self.view.backgroundColor = !isDefault ? .white :.darkGray
      self.setNeedsStatusBarAppearanceUpdate()  //요거 해줘야지 적용됨
    }
  }
  
  @IBAction private func toggleStatusBarHidden(_ sender: Any) {
    isStatusBarHidden.toggle()
    UIView.animate(withDuration: 0.5) {
      self.setNeedsStatusBarAppearanceUpdate()
    }
  }
  
  @IBAction private func toggleHomeIndicatorHidden(_ sender: Any) {
    isHomeIndicatorAutoHidden.toggle()
    setNeedsUpdateOfHomeIndicatorAutoHidden() // animation 자동 적용
  }
}

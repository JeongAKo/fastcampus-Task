//
//  ViewController.swift
//  AutoLayoutExample
//
//  Created by giftbot on 2018. 6. 17..
//  Copyright © 2018년 giftbot. All rights reserved.
//

import UIKit

final class ViewControllerFrame: UIViewController {
  
  private let redView = UIView()
  private let blueView = UIView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    redView.backgroundColor = .red
    view.addSubview(redView)
    
    blueView.backgroundColor = .blue
    view.addSubview(blueView)
    
    print("viewDidLoad :", view.safeAreaInsets)
    // (0,0,0,0) top, left, bottom, right
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    print("viewWillAppear :", view.safeAreaInsets)
    // (0,0,0,0)
  }
  
  override func viewSafeAreaInsetsDidChange() {
    super.viewSafeAreaInsetsDidChange()
    print("viewSafeAreaInsetsDidChange :", view.safeAreaInsets)
    // iPhone8 (20, 0, 0, 0)
    // iPhoneX 시리즈 (44, 0, 34, 0)
  }
  
  override func viewWillLayoutSubviews() {
    super.viewWillLayoutSubviews()
    print("viewWillLayoutSubviews :", view.safeAreaInsets)
    print()
    
    let margin: CGFloat = 20
    let padding: CGFloat = 10
    let safeLayoutInsets = view.safeAreaInsets
    let horizontalInset = safeLayoutInsets.left + safeLayoutInsets.right
    
    let yOffset = safeLayoutInsets.top + margin
    let viewWidth = (view.frame.width - padding - horizontalInset) / 2 - margin
    
    redView.frame = CGRect(
      x: safeLayoutInsets.left + margin,
      y: yOffset,
      width: viewWidth,
      height: view.bounds.height - yOffset - (safeLayoutInsets.bottom + margin)
    )
    
    blueView.frame = CGRect(
      origin: CGPoint(x: redView.frame.maxX + padding, y: yOffset),
      size: redView.bounds.size
    )
  }
}


//
//  ContainerViewController.swift
//  StatusBarAndHomeIndicatorExample
//
//  Created by CHANGGUEN YU on 28/05/2019.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

class ContainerViewController: UINavigationController {
//  override var preferredStatusBarStyle: UIStatusBarStyle {
//    return .lightContent
//  }
  
  override var childForStatusBarStyle: UIViewController? {
    return topViewController
  }
  
  override var childForStatusBarHidden: UIViewController? {
    return topViewController
  }
  
  override var childForHomeIndicatorAutoHidden: UIViewController? {
    return topViewController
  }
}


/****************************************************************************************
 
 탭바나 네비게이션바적용해줄땐 ↑↑↑↑ 이런식으로 topView 적용 해주어야 적용된다 
 
 ****************************************************************************************/

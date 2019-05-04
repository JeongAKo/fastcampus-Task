//
//  SecondViewController.swift
//  RGBColorNotification
//
//  Created by giftbot on 28/04/2019.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

final class SecondViewController: UIViewController {
  
  @IBOutlet private weak var colorView: UIView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    NotificationCenter.default
      .addObserver(self, selector: #selector(setColorViewBackgroundColor(_:)), name: ViewController.didSetRGBColorNotification, object: nil)
  }
  
  
  @objc private func setColorViewBackgroundColor(_ sender: Notification) {
    let postedColor = sender.object as! UIColor
    colorView.backgroundColor = postedColor
    
    /***************************************************
     특정한 값을 별도로 확인하고 싶을 때
     ***************************************************/
    var r: CGFloat = 0
    var g: CGFloat = 0
    var b: CGFloat = 0
    var a: CGFloat = 0
    if postedColor.getRed(&r, green: &g, blue: &b, alpha: &a) {
      print(r, g, b, a)
    }
  }
  
  deinit {
    NotificationCenter.default.removeObserver(self)
  }
}

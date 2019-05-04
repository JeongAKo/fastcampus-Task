//
//  ViewController.swift
//  RGBColorNotification
//
//  Created by giftbot on 28/04/2019.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
  
  @IBOutlet private weak var redSlider: UISlider!
  @IBOutlet private weak var greenSlider: UISlider!
  @IBOutlet private weak var blueSlider: UISlider!
  @IBOutlet private weak var alphaSlider: UISlider!
  
  @IBAction private func postSetColorNotification(_ sender: Any) {
    let color = UIColor(
      red: CGFloat(redSlider.value),
      green: CGFloat(greenSlider.value),
      blue: CGFloat(blueSlider.value),
      alpha: CGFloat(alphaSlider.value)
    )
    
    NotificationCenter.default
      .post(name: ViewController.didSetRGBColorNotification, object: color)
  }
}

extension ViewController {
  static var didSetRGBColorNotification: Notification.Name {
    return Notification.Name("DidSetRGBColorNotification")
  }
}

//
//  ViewController.swift
//  UserDefaults
//
//  Created by giftbot on 2018. 10. 3..
//  Copyright © 2018년 giftbot. All rights reserved.
//

import UIKit

let setData = UserDefaults()

final class ViewController: UIViewController {

  @IBOutlet private weak var datePicker: UIDatePicker!
  @IBOutlet private weak var alertSwitch: UISwitch!

  // MARK: Action Handler
  
  @IBAction func saveData(_ button: UIButton) {
    UserDefaults.standard.set(datePicker.date, forKey: "date")
    UserDefaults.standard.set(alertSwitch.isOn, forKey: "switch")
  }
  
  @IBAction func loadData(_ button: UIButton) {
  let date = UserDefaults.standard.object(forKey: "date")
  let toggle = UserDefaults.standard.bool(forKey: "switch")

    datePicker.setDate(date as? Date ?? Date(), animated: true)
    alertSwitch.isOn = toggle
    }
}

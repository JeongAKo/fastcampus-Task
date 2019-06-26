//
//  ViewController.swift
//  TableViewPractice
//
//  Created by 이봉원 on 15/04/2019.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
  
  /***************************************************
   누를 때마다 셀의 숫자가 1씩 올라가도록 처리
   ***************************************************/

  let tableView = UITableView()
  var data = Array(1...50)
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.frame = view.frame //view사이즈에 tableView를 맞춤
    tableView.dataSource = self
    tableView.rowHeight = 60
    view.addSubview(tableView)
    tableView.register(CustomCell.self, forCellReuseIdentifier: "CustomCell")
  }
  
//  @objc private func didTapButton(_ sender: UIButton) {
//    let cell = sender.superview?.superview as! CustomCell
//
//    if let indexPath = tableView.indexPath(for: cell) {
//      let addedNumber = data[indexPath.row] + 1
//      data[indexPath.row] = addedNumber
//      cell.textLabel?.text = "\(addedNumber)"
//        print("1번째 방법")
//    }
//
//    let addedNumber = data[sender.tag] + 1
//    data[sender.tag] = addedNumber
//    cell.textLabel?.text = "\(addedNumber)"
//  }
}

// MARK: - UITableViewDataSource

extension ViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return data.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomCell
    
    // 1) delegate
    cell.delegate = self
    
    
    // Tag
//    cell.button.tag = indexPath.row
    
    
    // 2
//    if cell.textLabel?.text == nil {
//      cell.button.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
//    }
    
    
    cell.textLabel?.text = "\(data[indexPath.row])"
    return cell
  }
}


// MARK: - CustomCellDelegate

extension ViewController: CustomCellDelegate {
  func customCell(_ customCell: CustomCell) {
//    let tag = button.tag

    if let indexPath = tableView.indexPath(for: customCell) {
      let addedNumber = data[indexPath.row] + 1
      data[indexPath.row] = addedNumber
      customCell.textLabel?.text = "\(addedNumber)"
        print("2번째 방법")
    }
  }
}



//
//  ViewController.swift
//  TableViewPractice
//
//  Created by Daisy on 15/04/2019.
//  Copyright © 2019 고정아. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {

    let tableView = UITableView()
    let data = Array(1...50)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.frame = view.frame
        tableView.rowHeight = 60
        tableView.dataSource = self
        tableView.register(CustomCellTableViewCell.self, forCellReuseIdentifier: "CustomCell")
        view.addSubview(tableView)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomCellTableViewCell
//        cell.delete = self
        
        cell.textLabel?.text = "\(data[indexPath.row])"
      
        return cell
    }
}

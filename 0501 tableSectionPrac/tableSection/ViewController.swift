//
//  ViewController.swift
//  tableSection
//
//  Created by Daisy on 01/05/2019.
//  Copyright © 2019 고정아. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var makeDict: [String : [String]] = [:]
    var titleSection:[String] = []
    
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        
        for menu in menuDatas {
            for product in menu.products {
                if let _ = makeDict[menu.category] {
                    makeDict[menu.category]?.append(product.name)
                }else {
                    makeDict[menu.category] = [product.name]
                }
            }
        }
        autoLayout()
        titleSection = makeDict.keys.sorted()
    }
    
    func configure() {
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellID")
        view.addSubview(tableView)
    }
    
    func autoLayout() {
        let guide = view.safeAreaLayoutGuide
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: guide.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: guide.bottomAnchor).isActive = true
    }
    
}

extension ViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        
        return titleSection.count
        // 섹션의 개수
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return makeDict[titleSection[section]]!.count
        //셀의 개수  타입을 봐라 요거 section 인지
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellID", for: indexPath)
        let values = makeDict[titleSection[indexPath.section]]
        let value = values![indexPath.row]
        cell.textLabel?.text = "\(value)"
        return cell
        //셀의 내용
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "\(titleSection[section])"
    }
}

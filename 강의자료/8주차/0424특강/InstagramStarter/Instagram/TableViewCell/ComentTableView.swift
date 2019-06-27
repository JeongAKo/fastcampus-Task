//
//  ComentTableView.swift
//  Instagram
//
//  Created by Daisy on 24/04/2019.
//  Copyright © 2019 Wi. All rights reserved.
//

import UIKit


//protocol ComentTableViewDelegate: class {
//    commetCell
//}
class ComentTableView: UITableViewController {

    let secondTableView = UITableView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        secondTableView.frame = view.frame
        secondTableView.dataSource = self
        secondTableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellID")
        view.addSubview(secondTableView)
    
    }
}
//extension ComentTableView: UITableViewDataSource {
//
//}

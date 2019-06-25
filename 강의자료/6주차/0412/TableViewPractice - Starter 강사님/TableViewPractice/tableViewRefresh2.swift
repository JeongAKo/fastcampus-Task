
//  TableViewRefresh.swift
//  TableViewPractice
//
//  Created by 이봉원 on 10/04/2019.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

final class TableViewRefresh2: UIViewController {
    
    /***************************************************
     UIRefreshControl을 이용해 목록을 갱신할 때마다 임의의 숫자들이 출력되도록 할 것
     랜덤 숫자의 범위는 출력할 숫자 개수의 +50 이며, 모든 숫자는 겹치지 않아야 함.
     e.g.
     20개 출력 시, 랜덤 숫자의 범위는 0 ~ 70
     40개 출력 시, 랜덤 숫자의 범위는 0 ~ 90
     
     < 참고 >
     (0...10).randomElement()  -  0부터 10사이에 임의의 숫자를 뽑아줌
     ***************************************************/
    
    var count = 20
    var numbers: [Int] = []
    
    //    func test() {
    //        #if swift(>=4.2)
    //        let num = (0...30).randomElement()!
    //        #else
    //        let num = Int(arc4random_uniform(UInt32(70)))
    //        #endif
    //    }
    
    func makeRand(){
        if numbers.count < count {
            #if swift(>=4.2)
            let num = (0...count).randomElement()!
            #else
            let num = Int(arc4random_uniform(UInt32(count+50))) // swift 4.2ver 아래는 이렇게 랜덤값 호출
            #endif
            if !numbers.contains(num) {
                numbers.append(num)
            }
            return makeRand()
        }
    }
    
    
    override var description: String {
        return "Practice 3 - Refresh"
    }
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let button1 = UIBarButtonItem(title: "reload", style: .done, target: self, action: #selector(reloadData))
        navigationItem.rightBarButtonItem = button1
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(reloadData), for: .valueChanged)
        refreshControl.tintColor = .blue
        refreshControl.attributedTitle = NSAttributedString(string: "Refreshing...")
        tableView.refreshControl = refreshControl
        makeRand()
        setupTableView()
    }
    
    
    
    @objc func reloadData() {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: false, block: { _ in
            self.tableView.refreshControl?.endRefreshing()
            self.self.numbers = []
            self.self.makeRand()
            self.tableView.reloadData()
        })
        
    }
    
    func setupTableView() {
        tableView.frame = view.frame
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellId")
    }
}

// MARK: - UITableViewDataSource

extension TableViewRefresh2: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numbers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellId", for: indexPath)
        cell.textLabel?.text = "\(numbers[indexPath.row])"
        return cell
    }
}




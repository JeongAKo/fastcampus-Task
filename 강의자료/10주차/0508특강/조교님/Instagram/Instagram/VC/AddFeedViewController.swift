//
//  AddFeedViewController.swift
//  Instagram
//
//  Created by Wi on 30/04/2019.
//  Copyright © 2019 Wi. All rights reserved.
//

import UIKit

class AddFeedViewController: UITableViewController {
    
    var image: UIImage?
    var user: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UserManager.shard.getUserInfo{ [weak self] user in
            self?.user = user
        }
    }
    // MARK: configure
    
    private func configure(){
        // navigation setting
        self.title = "새 게시물"
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "공유", style: .done, target: self, action: #selector(shardItemDidTap(_:)))
        
        // tableView setting
        tableView.register(UINib(nibName: "AddFeedTableViewCell", bundle: nil), forCellReuseIdentifier: "addFeed")
        tableView.separatorColor = .clear
    }
    
    // MARK: Action
    
    @objc private func shardItemDidTap(_ sender: UIBarButtonItem){
        guard let cell = tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? AddFeedTableViewCell else {return}
        var str =  cell.textView.text
        if cell.textView.text == "문구입력..."{
            str = ""
        }
        FeedManager.shared.addFeedData(FeedData(profileImage: user?.profileImage, nickName: user?.userName, feedImage: image, explanation: str))
        navigationController?.popViewController(animated: true)
    }
    
    
    // MARK: tableView
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "addFeed", for: indexPath) as! AddFeedTableViewCell
        cell.feedImageView.image = image
        cell.selectionStyle = .none
        return cell
    }

}

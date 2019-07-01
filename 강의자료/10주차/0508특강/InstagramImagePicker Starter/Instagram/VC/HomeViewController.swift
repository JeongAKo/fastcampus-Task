//
//  ViewController.swift
//  Instagram
//
//  Created by Wi on 11/04/2019.
//  Copyright © 2019 Wi. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    // MARK: - Properties
    
    var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    var feedDataArr = [FeedData]()
    
    let picker = UIImagePickerController()
    
    
    // MARK: - Methods
    
    // MARK: life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        feedDataArr = FeedManager.shared.returnFeedData()
        tableView.reloadData()
    }
    
  
    
    func configure(){
        // create dataArr
//        createFeedData()
        
        // navigation item setting
        naviSetting()
        
        // tableViewSetting
        tableViewRegister()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorColor = .clear
        
        // addSubView
        view.addSubview(tableView)
        
        // autolayout
        autoLayout()
        
        // noti
        
        NotificationCenter.default.addObserver(self, selector: #selector(pushCommentVC), name: NSNotification.Name(rawValue: "CommentTap"), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(photoSelected), name: NSNotification.Name("photoSelected"), object: nil)
    }
    
    @objc private func photoSelected(_ sender: Notification) {
        guard let image = sender.userInfo!["image"] as? UIImage else {return}
        
        let vc = AddFeedTableViewController()
        vc.image = image
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func naviSetting(){
        let naviTitleView = UIImageView(image: UIImage(named: AppImageData.logo))
        naviTitleView.contentMode = .scaleAspectFit
        self.navigationItem.titleView = naviTitleView
        self.navigationItem.setLeftBarButton(UIBarButtonItem(image: UIImage(named: AppImageData.camera), style: .plain, target: self, action: #selector(cameraButtonDidTap(_:))), animated: true)
    }
    
    func tableViewRegister(){
        tableView.register(UINib(nibName: "FeedTableViewCell", bundle: nil), forCellReuseIdentifier: "feed")
    }
    
    // MARK: Action
    // 카메라 버튼이 눌렸을때 호출될 함수입니다.
    @objc private func cameraButtonDidTap(_ sender: UIBarButtonItem){
        
        picker.delegate = self
        picker.sourceType = .camera
        
        present(picker, animated: true)
        
        print("camera Button Tap")
    }
    
    @objc private func pushCommentVC(_ sender: Notification){
        print("pushComeentVC")
        guard let userInfo = sender.userInfo, let optionalCell = userInfo["cell"] , let cell = optionalCell as? UITableViewCell , let indexPath = tableView.indexPath(for: cell) else {return}
        let commentVC = CommentViewController()
        commentVC.feedData = feedDataArr[indexPath.row]
        show(commentVC, sender: nil)
    }
    
    // MARK: AutoLayout
    
    func autoLayout(){
        let guide = self.view.safeAreaLayoutGuide
        
        self.tableView.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
        self.tableView.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
        self.tableView.topAnchor.constraint(equalTo: guide.topAnchor).isActive = true
        self.tableView.bottomAnchor.constraint(equalTo: guide.bottomAnchor).isActive = true
    }

}

extension HomeViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feedDataArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "feed", for: indexPath) as! FeedTableViewCell
        cell.feedData = feedDataArr[indexPath.row]
        return cell
    }
    
}

extension HomeViewController: UITableViewDelegate{
    
}

extension HomeViewController: UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info:
        [UIImagePickerController.InfoKey : Any]) {
        // 인포는 딕셔너리 타입으로 벨류로 내가 고른 이미지가 들어온다.
        let vc = AddFeedTableViewController()
        vc.image = info[.originalImage] as? UIImage
        
        //딕셔너리에서 키값으로 가져오면 타입이 Any이기 때문에 타입변환을 해주어애 한다.
        
        navigationController?.pushViewController(vc, animated: true)
        
        picker.dismiss(animated: false, completion: nil)
       
    }
}

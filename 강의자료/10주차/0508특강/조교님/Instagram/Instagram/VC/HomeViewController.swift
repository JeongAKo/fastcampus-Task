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
    // 1 이미지피커 객체만들기
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
    
    // MARK: other func
    
    func configure(){
        // create dataArr
        // 더이상 데이터 생성을 임의로 하지 않아요
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
        NotificationCenter.default.addObserver(self, selector: #selector(photoSeleted), name: NSNotification.Name("photoSelected"), object: nil)
    }
    
    func naviSetting(){
        let naviTitleView = UIImageView(image: UIImage(named: AppImageData.logo))
        naviTitleView.contentMode = .scaleAspectFit
        self.navigationItem.titleView = naviTitleView
        
        self.navigationItem.setLeftBarButton(UIBarButtonItem(image: UIImage(named: AppImageData.camera), style: .plain, target: self, action: #selector(cameraButtonDidTap(_:))), animated: true)
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: nil, style: .plain, target: nil, action: nil)
        self.navigationItem.backBarButtonItem?.tintColor = .black
    }
    
    func tableViewRegister(){
        tableView.register(UINib(nibName: "FeedTableViewCell", bundle: nil), forCellReuseIdentifier: "feed")
    }
    
    // MARK: Action
    
    @objc private func photoSeleted(_ sender: Notification){
        guard let userInfo = sender.userInfo, let image = userInfo["image"] else {return}
        let vc = AddFeedViewController()
        vc.image = image as? UIImage
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func cameraButtonDidTap(_ sender: UIBarButtonItem){
        print("camera Button Tap")
        // 3 델리게이트 지정하기
        picker.delegate = self
        // 4 소스타입 정하기
        picker.sourceType = .camera
        
        picker.modalPresentationStyle = .overFullScreen
        // 5 picker 띄우기
        present(picker, animated: true)
        
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

// 2 네비게이션과 이미지픽커 델리게이트 채택하기
extension HomeViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    // 6 이미지를 선택하거나 카메라로 찍고 UsePhoto 눌렀을때
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let vc = AddFeedViewController()
        // 7 info 딕셔너리 안에서 이미지 꺼내 형변환 하기
        vc.image = info[.originalImage] as? UIImage
        navigationController?.pushViewController(vc, animated: true)
        // 8 picker 내려주기
        picker.dismiss(animated: false, completion: nil)
    }
}


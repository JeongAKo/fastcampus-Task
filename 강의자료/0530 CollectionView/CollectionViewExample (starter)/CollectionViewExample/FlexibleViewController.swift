//
//  FlexibleViewController.swift
//  CollectionViewExample
//
//  Created by giftbot on 30/05/2019.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

final class FlexibleViewController: UIViewController {
    
    private enum UI {
        static let itemsInLine: CGFloat = 3
        static let linesOnScreen: CGFloat = 4
        static let itemSpacing: CGFloat = 10.0
        static let lineSpacing: CGFloat = 10.0
        static let edgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 0, right: 10)
        static let nextOffset: CGFloat = 40
    }
    
    
    let layout = UICollectionViewFlowLayout()
    lazy var collectionView = UICollectionView(frame: view.frame,
                                               collectionViewLayout: layout)
    var parkImages = ParkManager.imageNames(of: .nationalPark)
    
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        setupNavigationItem()
    }
    
    // MARK: Setup CollectionView
    
    func setupCollectionView() {
        
    collectionView.register(CustomCell.self, forCellWithReuseIdentifier: CustomCell.identifier
        )
        collectionView.backgroundColor = .clear
        collectionView.dataSource = self
        view.addSubview(collectionView)
        
        setupFlowLayout()
    }
    override func viewSafeAreaInsetsDidChange() {
        setupFlowLayout()  //최초로 적용해줄때 시점생각
    }
    
    
    // MARK: Setup FlowLayout
    
    func setupFlowLayout() {
        layout.minimumInteritemSpacing = UI.itemSpacing
        layout.minimumLineSpacing = UI.lineSpacing
        layout.sectionInset = UI.edgeInsets
        
        let itemSpacing = UI.itemSpacing * (UI.itemsInLine - 1)
        let horizontalInset = UI.edgeInsets.left + UI.edgeInsets.right
        let verticalInset = UI.edgeInsets.top + UI.edgeInsets.bottom + view.safeAreaInsets.top + view.safeAreaInsets.bottom
        
        if layout.scrollDirection == .vertical {
            let horizontalSpacing = itemSpacing + horizontalInset
            let verticalSpacing = itemSpacing + verticalInset
            
            let width =
                (collectionView.frame.width - horizontalSpacing) / UI.itemsInLine
            let height = (collectionView.frame.height - verticalSpacing) / UI.linesOnScreen
            
//            let rounded = width.rounded(.down)
            
            let widthRounded = width.rounded(.down)
            let heightRounded = height.rounded(.down)
            
            layout.itemSize = CGSize(width: widthRounded, height: heightRounded)
        } else {
            let verticalSpacing = itemSpacing + verticalInset
            let height = (collectionView.frame.height - verticalSpacing) / UI.itemsInLine
            let rounded = height.rounded(.down)
            layout.itemSize = CGSize(width: rounded, height: rounded)
        }
        
    }
    
    // MARK: Setup NavigationItem
    
    func setupNavigationItem() {
        let changeDirection = UIBarButtonItem(
            barButtonSystemItem: .reply,
            target: self,
            action: #selector(changeCollectionViewDirection(_:))
        )
        navigationItem.rightBarButtonItems = [changeDirection]
    }
    
    // MARK: - Action Handler
    
    @objc private func changeCollectionViewDirection(_ sender: Any) {
        
        let current = layout.scrollDirection
        layout.scrollDirection = (current == .horizontal) ? .vertical : .horizontal
        
        setupFlowLayout()
        
        
    }
    
}

// MARK: - UICollectionViewDataSource

extension FlexibleViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return parkImages.count * 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: CustomCell.identifier,
            for: indexPath
            ) as! CustomCell
        
        let item = indexPath.item % parkImages.count
        cell.configure(image: UIImage(named: parkImages[item]), title: parkImages[item]
        )
        cell.backgroundColor = .black
        
        return cell
    }
}




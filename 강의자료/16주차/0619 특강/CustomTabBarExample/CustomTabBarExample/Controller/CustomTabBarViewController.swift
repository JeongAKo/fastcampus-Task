//
//  CustomTabBarViewController.swift
//  CustomTabBarExample
//
//  Created by Daisy on 19/06/2019.
//  Copyright © 2019 고정아. All rights reserved.
//

import UIKit

class CustomTabBarViewController: UIViewController {

    // MARK: - Properties
    
    let menuBar = MenuBar()
    
    let pageCollectionView: UICollectionView = {
        
        //flow layout
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        
        // collectionView
        let collectionView = UICollectionView(frame: .zero,
                                              collectionViewLayout:  flowLayout
        )
        
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.isPagingEnabled = true
        collectionView.backgroundColor = .white
        
        return collectionView
    }()
    
    var menutitles = ["menu1", "menu2", "menu3", "menu4", "menu5"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureCustomTabBar()
        
    }
    
    private func configureCustomTabBar() {
        menuBar.translatesAutoresizingMaskIntoConstraints = false
        menuBar.menutitles = menutitles
        menuBar.delegate = self
        // FIXME: -
        view.addSubview(menuBar)
        
        
        
        let guide = view.safeAreaLayoutGuide
        menuBar.topAnchor.constraint(equalTo: guide.topAnchor).isActive = true
        menuBar.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        menuBar.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        menuBar.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        menuBar.indicatorBar.widthAnchor.constraint(equalToConstant: self.view.frame.width / CGFloat(menutitles.count)).isActive = true
        
        // page collection view
        
        
        // delelgation
        pageCollectionView.delegate = self
        pageCollectionView.dataSource = self
        
        // register
        pageCollectionView.register(MenuCell.self, forCellWithReuseIdentifier: "menuCell")
        
        // layout
        view.addSubview(pageCollectionView)
        pageCollectionView.topAnchor.constraint(equalTo: menuBar.bottomAnchor).isActive = true
        pageCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        pageCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        pageCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
    }
}

extension CustomTabBarViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menutitles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "menuCell", for: indexPath) as! MenuCell
        cell.label.text = menutitles[indexPath.row]
        return cell
    }
}

extension CustomTabBarViewController: UICollectionViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        menuBar.indicatorBarLeadingConstraint.constant = scrollView.contentOffset.x / CGFloat(menutitles.count)
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
       let itemAt = Int(targetContentOffset.pointee.x / self.view.frame.width)
        menuBar.menuCollectionView.selectItem(at: IndexPath(item: itemAt, section: 0), animated: true, scrollPosition: .centeredHorizontally)
    }
}

extension CustomTabBarViewController: MenuBarDelegate{
    func menuBarDidSelected(_ indexPath: IndexPath) {
        pageCollectionView.selectItem(at: indexPath, animated: true, scrollPosition: .centeredHorizontally)
        print("indexPath",indexPath)
    }
}


extension CustomTabBarViewController: UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width, height: self.view.frame.height - menuBar.frame.height)
    }
    
    // ↓ 둘다 '0' 이면 간격을 안준다는 것
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

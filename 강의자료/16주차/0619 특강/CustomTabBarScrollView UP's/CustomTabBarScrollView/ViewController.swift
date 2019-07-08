//
//  ViewController.swift
//  CustomTabBarScrollView
//
//  Created by Kira on 19/06/2019.
//  Copyright © 2019 Kira. All rights reserved.
//

import UIKit

private struct Standard {
  static let space: CGFloat = 10
  
  static let buttonWidth: CGFloat = 100
  static let itemsScrollViewHeight: CGFloat = 40
  static let indicatorHeight: CGFloat = 3
}

class ViewController: UIViewController {
  
  private let items = ["item1", "item2", "item3", "item4", "item5", "item6"]
  private var itemButtons = [UIButton]()
  private var contentLabels = [UILabel]()
  private var indicatorViewY: CGFloat = {
    return Standard.itemsScrollViewHeight - Standard.indicatorHeight
  }()
  
  private let itemsScrollView = UIScrollView()
  private let indicatorView = UIView()
  private let contentsScrollView = UIScrollView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    navigationSet()
    configure()
    autoLayout()
  }
  
  private var isHeightSetting = true
  private var contentsScrollViewHeight: CGFloat = 0
  override func viewWillLayoutSubviews() {
    super.viewWillLayoutSubviews()
    if isHeightSetting {
      contentsScrollViewHeight = view.frame.height - view.safeAreaInsets.top - Standard.itemsScrollViewHeight
      createContentsView()
      isHeightSetting = false
    }
  }
  
  private func navigationSet() {
    navigationItem.title = "Egiyo"
    navigationController?.navigationBar.shadowImage = UIImage()
    navigationController?.navigationBar.barTintColor = .white
  }
  
  private func configure() {
    itemsScrollView.showsHorizontalScrollIndicator = false
    view.addSubview(itemsScrollView)
    createItemButton()
    
    contentsScrollView.isPagingEnabled = true
    contentsScrollView.delegate = self
    view.addSubview(contentsScrollView)
    
    
    indicatorView.backgroundColor = .darkGray
    indicatorView.frame.size = CGSize(width: Standard.buttonWidth, height: Standard.indicatorHeight)
    indicatorView.frame.origin = CGPoint(x: 0, y: indicatorViewY)
    itemsScrollView.addSubview(indicatorView)
  }
  
  private func createItemButton() {
    for item in items {
      let button = UIButton()
      button.setTitle(item, for: .normal)
      button.setTitleColor(.darkGray, for: .normal)
      button.addTarget(self, action: #selector(itemButtonAction), for: .touchUpInside)
      itemButtons.append(button)
      itemsScrollView.addSubview(button)
      
      button.translatesAutoresizingMaskIntoConstraints = false
      button.topAnchor.constraint(equalTo: itemsScrollView.topAnchor).isActive = true
      button.bottomAnchor.constraint(equalTo: itemsScrollView.bottomAnchor).isActive = true
      button.widthAnchor.constraint(equalToConstant: Standard.buttonWidth).isActive = true
    }
    
    for index in 0..<itemButtons.count {
      switch index {
      case 0:
        itemButtons[0].leadingAnchor.constraint(equalTo: itemsScrollView.leadingAnchor).isActive = true
      case itemButtons.count - 1 :
        itemButtons[index].trailingAnchor.constraint(equalTo: itemsScrollView.trailingAnchor).isActive = true
        fallthrough
      default :
        itemButtons[index].leadingAnchor.constraint(equalTo: itemButtons[index - 1].trailingAnchor).isActive = true
      }
    }
  }
  
  @objc private func itemButtonAction(_ sender: UIButton) {
    guard let index = self.itemButtons.firstIndex(of: sender) else {return}
    //    indicatorAnimate(index: index)
    contentsScrollViewAnimate(index: index)
  }
  
  private func indicatorAnimate(index: Int) {
    UIView.animate(withDuration: 0.2) {
      let indicatorViewX = Standard.buttonWidth * CGFloat(index)
      self.indicatorView.frame.origin = CGPoint(x: indicatorViewX, y: self.indicatorViewY)
      self.view.layoutIfNeeded()
    }
  }
  
  private func contentsScrollViewAnimate(index: Int) {
    let point = CGPoint(x: view.frame.width * CGFloat(index), y: 0)
    contentsScrollView.setContentOffset(point, animated: true)
  }
  
  private func createContentsView() {
    for item in items {
      let label = UILabel()
      label.text = item
      label.textColor = .white
      label.textAlignment = .center
      label.backgroundColor = randomColor()
      label.font = UIFont.systemFont(ofSize: 40, weight: .bold)
      contentLabels.append(label)
      contentsScrollView.addSubview(label)
      
      label.translatesAutoresizingMaskIntoConstraints = false
      label.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
      label.heightAnchor.constraint(equalToConstant: contentsScrollViewHeight).isActive = true
    }
    
    for index in 0..<contentLabels.count {
      switch index {
      case 0:
        contentLabels[0].leadingAnchor.constraint(equalTo: contentsScrollView.leadingAnchor).isActive = true
      case itemButtons.count - 1 :
        contentLabels[index].trailingAnchor.constraint(equalTo: contentsScrollView.trailingAnchor).isActive = true
        fallthrough
      default :
        contentLabels[index].leadingAnchor.constraint(equalTo: contentLabels[index - 1].trailingAnchor).isActive = true
      }
    }
  }
  
  private func randomColor() -> UIColor {
    let red = CGFloat.random(in: 0.5 ... 1.0)
    let green = CGFloat.random(in: 0.5 ... 1.0)
    let blue = CGFloat.random(in: 0.5 ... 1.0)
    return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
  }
  
  private func autoLayout() {
    itemsScrollView.translatesAutoresizingMaskIntoConstraints = false
    itemsScrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
    itemsScrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
    itemsScrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
    itemsScrollView.heightAnchor.constraint(equalToConstant: Standard.itemsScrollViewHeight).isActive = true
    
    contentsScrollView.translatesAutoresizingMaskIntoConstraints = false
    contentsScrollView.topAnchor.constraint(equalTo: itemsScrollView.bottomAnchor).isActive = true
    contentsScrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
    contentsScrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
    contentsScrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
  }
}

extension ViewController: UIScrollViewDelegate {
  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    let index = round(scrollView.contentOffset.x / view.frame.width)
    indicatorAnimate(index: Int(index))
  }
}


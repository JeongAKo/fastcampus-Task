//
//  ViewController.swift
//  AutoLatout3
//
//  Created by Daisy on 09/04/2019.
//  Copyright © 2019 고정아. All rights reserved.







//viewWillAppear -> viewWillLayoutSubviews -> viewDidLayoutSubviews -> viewDidAppear
//동작 순서/ 세이프레이아웃이셋은 뷰윌레이아웃 섭뷰에서 설정하면됨 정확하게는 .....



import UIKit

class ViewController: UIViewController {

    let redView = UIView()
    let blueView = UIView()
    let margin : CGFloat = 10
//    let safeLayotInsets = view.safeAreaInsets
    

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print("viewWillLayoutSubviews:", view.safeAreaInsets)
        print()
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    
        redView.backgroundColor = .red
        redView.frame = CGRect(x: 20, y: view.safeAreaInsets.top, width: view.frame.width/2 - 25 , height: view.frame.height - view.safeAreaInsets .bottom - view.safeAreaInsets .top)
        print(view.safeAreaInsets.top)
        
        
        blueView.backgroundColor = .blue
        blueView.frame = CGRect(x: view.frame.width/2 - 30, y: view.safeAreaInsets.top, width: view.frame.width/2 - 25, height: view.frame.height - view.safeAreaInsets .bottom - view.safeAreaInsets .top)
        
        
        view.addSubview(redView)
        view.addSubview(blueView)
        
    
    }
    
//    iphone8 - 20,0,0,0
//    iphone X - 44,0,34,0
    
    
//    view.safeAreaInsets 쩜찍어서 top or ...
//    UIApplication.shared.statusBarFrame 스테이터스바 10이상에서는 바닥쪽에 구현이 어려움
    
    override func viewDidLoad() {
        super.viewDidLoad()
      

        
    }


}


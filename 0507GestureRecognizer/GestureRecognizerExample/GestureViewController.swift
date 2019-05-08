//
//  GestureViewController.swift
//  GestureRecognizerExample
//
//  Created by giftbot on 02/05/2019.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

class GestureViewController: UIViewController {
    
    @IBOutlet private weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.layer.cornerRadius = imageView.frame.width / 2
        imageView.layer.masksToBounds = true
    }
    var isQuagruple = false
    @IBAction func handleTabGesture(_ sender: UITapGestureRecognizer) {
        print("Double Tapped")
        if !isQuagruple {
            imageView.transform = imageView.transform.scaledBy(x: 2, y: 2)
        } else {
            imageView.transform = CGAffineTransform.identity
        }
        isQuagruple.toggle()
    }
    
    @IBAction func handleRatationGesture(_ sender: UIRotationGestureRecognizer) {
        let rotation = sender.rotation
        
       imageView.transform = imageView.transform.rotated(by: rotation) //이거 너무 빨리돔
       sender.rotation = 0 //그래서 이거 해줘야함 단위행렬 어쩌구 근데 크게한 상태에서 돌리면 다시작아짐 위에 뭐 겹쳐서
//        imageView.transform = CGAffineTransform.identity.rotated(by: rotation)
        // ↑↑↑↑ 그냥 이거 쓰자 ↑↑↑↑
        
    }
    
    
    
    @IBAction func swipeGesture(_ sender: UISwipeGestureRecognizer) {
        if sender.direction == .left {
        imageView.image = UIImage(named: "cat2")
        } else {
            imageView.image = UIImage(named: "cat1")
        }

    }
    
    
}


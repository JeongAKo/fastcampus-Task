//
//  ViewController.swift
//  0507GesturePrac
//
//  Created by Daisy on 08/05/2019.
//  Copyright © 2019 고정아. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var countTapNumLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    
    var pastTappedLocation = CGPoint.zero
    var tappedCountNum = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        guard let touch = touches.first else {return}
        let touchPoint = touch.location(in: touch.view)
        
        // 첫번째 포인트와 두번째 포인트를 변경해 주기 위해서 새로운 변수 선언
        if touchPoint == CGPoint.zero {
            pastTappedLocation = touchPoint
        }
        
        if abs(touchPoint.x - pastTappedLocation.x) >= 10 || abs(touchPoint.y - pastTappedLocation.y) >= 10 {
            tappedCountNum = 0
        }
        
        tappedCountNum += 1
        countTapNumLabel.text = "횟수 : \(tappedCountNum)"
        locationLabel.text = "좌표 : \(touchPoint)"
        pastTappedLocation = touchPoint
    }

}


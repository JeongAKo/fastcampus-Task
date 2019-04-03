//
//  SecondViewController.swift
//  viewControllerTransition_Prac2
//
//  Created by Daisy on 03/04/2019.
//  Copyright © 2019 고정아. All rights reserved.
//

import UIKit


var text = ""

class SecondViewController: UIViewController {
    
    
    @IBOutlet weak var segueControllerView: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func segueController(_ sender: UISegmentedControl) {
        if ( sender.selectedSegmentIndex == 0 )
        {
            text = "IOS"
        }
        else if( sender.selectedSegmentIndex == 1 )
        {
            text = "MacOS";
        }
        else if( sender.selectedSegmentIndex == 2 )
        {
            text = "WatchOS";
        }
        else if( sender.selectedSegmentIndex == 3 )
        {
            text = "TVOS";
        }
        
    }
    
    //prepare 는 본인꺼를 넘겨줄때
    //selectedSegmentIndex 인덱스를 반환 -> 메소드
    //titleForSegment 세그먼티드 컨드롤러의 타이틀 값을 반환  -> 메소드

//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        super.prepare(for: segue, sender: sender)
//        guard let vc = segue.destination as? ViewController else {
//            return
//        }
//        vc.lable.text = segueControllerView.titleForSegment(at: segueControllerView.selectedSegmentIndex) ?? ""
//    }
    
    
}

//
//  ViewController.swift
//  viewControllerTransition_Prac2
//
//  Created by Daisy on 03/04/2019.
//  Copyright © 2019 고정아. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lable: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func unwindToSecond(_ unwindSegue: UIStoryboardSegue) {
        let sourceViewController = unwindSegue.source
        guard let vc = unwindSegue.source as? SecondViewController else {return}
                lable.text = vc.segueControllerView.titleForSegment(at: vc.segueControllerView.selectedSegmentIndex)
        
//            let text = vc.segueControllerView.titleForSegment(at: 0)
//            lable.text = text
    }
}


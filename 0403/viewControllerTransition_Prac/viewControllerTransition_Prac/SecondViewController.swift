//
//  SecondViewController.swift
//  viewControllerTransition_Prac
//
//  Created by Daisy on 02/04/2019.
//  Copyright © 2019 고정아. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
   
    @IBOutlet weak var allCountButton: UIButton!
    
    var count = 0

    
    @IBOutlet weak var animalImage: UIImageView!
    var image: UIImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        animalImage.image = image
        
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func allCountActionB(_ sender: Any) {
        count += 1
       
    }
    
}

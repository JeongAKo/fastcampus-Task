//
//  ViewController.swift
//  storyboardSegue
//
//  Created by Daisy on 02/04/2019.
//  Copyright © 2019 고정아. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    @IBOutlet weak var countLabel: UILabel!
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //should 이 메소드가 실행할 것인가 말것인가
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        let shouldPerform: Bool = true
        let plus = identifier == "PlusOne" ? 1 : 10
        return count + plus <= 50
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        guard let dest = segue.destination as? SecondViewController,
         let id = segue.identifier
            else {return}
//        let secVC = segue.destination as! SecondViewController
//        count += 1
//        dest.countLabel.text = String(count)
        
        count += id == "PlusOne" ? 1 : 10
        dest.count = count
      
        
            //sender 이벤트를 보내는 객체   //identifier 이름 변경
            
            
        print("destination :", segue.destination)
        print("identifier :", segue.identifier)
    }
    @IBAction func unwindToFirstViewController(_ unwindSegue: UIStoryboardSegue) {
        guard let sourse = unwindSegue.source as?
            SecondViewController else { return }
        count -= sourse.minus
        countLabel.text = String(count)
        
    }
    
    
    //소스는 출발지
    //Action segue -> ShouldPerformSegue ->Prepare
    //ManualSegue -> Should(X) -> perFormSegue ->Prepare
    override func performSegue(withIdentifier identifier: String, sender: Any?) {
        super.performSegue(withIdentifier: identifier, sender: sender)
    }
    
    @IBAction func didtapPlusOne(_ sender: Any) {
        performSegue(withIdentifier: "PlusOne", sender: sender)
    }
    @IBAction func didtapPlusTen(_ sender: Any) {
        performSegue(withIdentifier: "PlusTen", sender: sender)
    }
}


//스토리보드로만 구현할 때
//let storyboard = UIStoryboard(name: "Main", bundle: nil)
//guard let secondVC = storyboard.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController else { return }
//secondVC.count = count
//present(secondVC, animated: true)

//
//  ViewController.swift
//  viewControllerTransition_Prac
//
//  Created by Daisy on 02/04/2019.
//  Copyright © 2019 고정아. All rights reserved.
//

/***********************************************************************************************
// [ 과제 ]
// 1.
// 위와 같이 task1 이라는 변수가 있을 때
 / task1 + task1 의 결과가 제대로 출력되도록 할 것

func addTwoValues(a: Int, b: Int) -> Int {
    return a + b
}
let task1: Any = addTwoValues(a: 2, b: 3)

if let result = task1 as? Int{
    result + result
}
 
 ***********************************************************************************************/



import UIKit

class ViewController: UIViewController {
    
    var dogCount = 0
    var catCount = 0
    var flogCount = 0
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    

    @IBAction func unwindToFirstVC(_ unwindSegue: UIStoryboardSegue) {
        let sourceViewController = unwindSegue.source
        guard let vc = unwindSegue.source as? SecondViewController else { return }
        dogCount += vc.count
        catCount += vc.count
        flogCount += vc.count
        print(dogCount,catCount,flogCount)
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "개" {
            return dogCount < 3
        } else if identifier == "개구리" {
            return flogCount < 4
        } else {
            return catCount < 5
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let second = segue.destination as! SecondViewController
        if let id = segue.identifier {
            if id == "개" {
                second.image = UIImage(named: "개")!
                dogCount += 1 
            } else if id == "개구리" {
                second.image = UIImage(named: "개구리")!
                flogCount += 1
            } else if id == "고양이" {
                second.image = UIImage(named: "고양이")!
                catCount += 1
            }
            
        }
        
    }
}








 
 
 
 /********************************************************************************************
 2. 스토리보드 이용할 것
 - FirstVC 에 개, 고양이, 새 라는 이름의 UIButton 3개 생성
 - SecondVC 에 UIImageView 하나와 Dismiss 를 위한 버튼 하나 생성
 - FirstVC에 있는 버튼 3개 중 하나를 누르면 그 타이틀에 맞는 이미지를 SecondVC의 ImageView 에 넣기
 (이미지는 구글링 등을 통해 활용)
 - 각 버튼별로 전환 횟수를 세서 개는 8회, 고양이는 10회, 새는 15회가 넘어서면 화면이 전환되지 않도록 막기
 - 그리고 SecondVC 에 추가로 UIButton 을 하나 더 생성하여 그 버튼을 누를 때마다 전환 횟수를 계산하는 값이 개와 고양이, 새 모두에 대해 1회씩 추가되도록 구현
 
 
 
 3. 클래스 매니저 과제
 - 첫번째 뷰에 레이블과 버튼을 생성하고 버튼을 통해 두번쨰 뷰로 이동.
 - 두번째 뷰에는 segmentedController 를 생성하고 선택한값을 첫번째 뷰의 레이블에 띄우세요.
 
 
 
 
 
 [ 도전 과제 ]
 1.
 let task2: Any = addTwoValues
 위와 같이 task2 라는 변수가 있을 때
 task2 + task2 의 결과가 제대로 출력되도록 할 것 (addTwoValues의 각 파라미터에는 2와 3 입력)
 
 2.
 class Car {}
 let values: [Any] = [0, 0.0, (2.0, Double.pi), Car(), { (str: String) -> Int in str.count }]
 
 위 values 변수의 각 값을 switch 문과 타입캐스팅을 이용해 출력하기
 *******************************************************************************************/

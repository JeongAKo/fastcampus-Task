import UIKit


/****************************************************************************************
 예제 출력
 
 ******
 *****
 ****
 ***
 **
 *
 
 
 ****************************************************************************************/
func stampStars(_ num: Int) {
    
    var star:String = "*"
    var tempStarArray: [String] = [star]
    
    for _ in 0...num {
        
        star += "*"
        tempStarArray.append(star)
    }
    for index in 0...num {
        print(tempStarArray[num - index])
    }
}
stampStars(5)





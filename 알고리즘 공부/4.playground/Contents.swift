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
    var blank:String = " "
    var tempStarArray: [String] = [star]
    var tempBlankArray: [String] = [blank]
    
    for _ in 0...num {
        
        star += "*"
        blank += " "
        tempStarArray.append(star)
        tempBlankArray.append(blank)
    }
    for index in 0...num {
        print("\(tempBlankArray[index] + tempStarArray[num - index])")
    }
}
stampStars(5)





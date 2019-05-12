import UIKit

/****************************************************************************************
 예제 출력
 
      *
     **
    ***
   ****
  *****
 ******
 
 
 ****************************************************************************************/

func dotStars(_ num: Int) {
    var blankCount:String = " "
    var starString:String = "*"
    var tempBlankArray:[String] = [blankCount]
    var tempStarArray:[String] = [starString]
    
    for _ in 0...num {
        
        blankCount += " "
        starString += "*"
        tempBlankArray.append(blankCount)
        tempStarArray.append(starString)
    }
    
    for index in 0...num {
    print("\(tempBlankArray[num - index] + tempStarArray[index])")
        
    }
}

dotStars(5)


import UIKit


func dotStar(_ num: Int) {
    
    var star = "*"
    
    for _ in 1...num {
        print(star)
        star += "*"
    }
}
dotStar(5)



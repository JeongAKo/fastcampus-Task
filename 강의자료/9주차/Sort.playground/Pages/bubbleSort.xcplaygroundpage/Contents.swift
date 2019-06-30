import UIKit

var input = [6, 5, 1, 3, 10, 2, 7, 14, 9]
var temp = 0
//var result:[Int] = []

func bubbleSort(input: inout [Int]) {
    
    for j in 1..<input.count {
        for i in 0..<input.count - j {
            if input[i] > input[i + 1] {
                let temp = input[i]
                input[i] = input[i + 1]
                input[i + 1] = temp
            
            }
        }
    }
    
    
}


/****************************************************************************************
 강사님 코드 
 ****************************************************************************************/


func bubbleSort1(input: inout [Int]) {
    guard !input.isEmpty else { return }
    for i in 1..<input.count {
        for idx in 0..<input.count - i {
            print("\(i):", input)
            guard input[idx] > input[idx + 1] else { continue }
            input.swapAt(idx, idx + 1)
        }
    }
}

bubbleSort1(input: &input)

print(input)

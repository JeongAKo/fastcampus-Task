//: [Previous](@previous)

import Foundation

var input = [6, 5, 1, 3, 10, 2, 7, 14, 9]

func insertionSort(input: inout [Int]) {
    
    for i in 1..<input.count {
        for j in (1...i).reversed() {
            if input[j] < input[j - 1] {
                input.swapAt(j, j - 1 )
            }
        }
    }
}
    insertionSort(input: &input)
    
    print(insertionSort)


/****************************************************************************************
 강사님 코드
 ****************************************************************************************/

    func insertionSort1(input: inout [Int]) {
        guard !input.isEmpty else { return }
        for idx in 1..<input.count {
            let currentValue = input[idx]
            var insertionIdx = idx
            
            for comparisonIdx in (0..<idx).reversed() {
                guard currentValue < input[comparisonIdx] else { break }
                input[comparisonIdx + 1] = input[comparisonIdx]
                insertionIdx = comparisonIdx
            }
            input[insertionIdx] = currentValue
        }
}
    insertionSort1(input: &input)
    
    print(insertionSort1)

//: [Next](@next)

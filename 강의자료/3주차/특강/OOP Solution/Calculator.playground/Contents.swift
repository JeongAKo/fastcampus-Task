import Foundation

class Calculator {
  
  var accumulator: Int = 0
  
  func add(_ num: Int) -> Int {
    accumulator = accumulator + num
    return accumulator
  }
  
  func subtract(_ num: Int) -> Int {
    accumulator = accumulator - num
    return accumulator
  }
  
  func reset() {
    accumulator = 0
  }
}

let calculator = Calculator()
calculator.add(10)
calculator.add(5)
calculator.subtract(20)
calculator.reset()

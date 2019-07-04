//: [Previous](@previous)
//: # Value Type Capture
print("\n---------- [ Value Type Capture ] ----------\n")
var a = 1
var b = 2
var c = 10
var result = 0
print("초기 값 :", a, b, c, result)

({
  result = a + b + c
  print("클로저 내부 값 :", a, b, c, result)
})()

b = 4
print("실행 이후 값 :", a, b, c, result)
print()


let valueCapture = { [a, b] in
  result = a + b + c
  print("클로저 내부 값 :", a, b, c, result)
}
a = 10
b = 10
c = 5
result = a + b + c
print("초기 값 :", a, b, c, result)

valueCapture()
print("실행 이후 값 :", a, b, c, result)


//: # Reference Type Capture
print("\n---------- [ RefType Capture ] ----------\n")

final class RefType {
  var number = 0
}
var x = RefType()
var y = RefType()
print("초기화 값 :", x.number, y.number)

let refCapture = { [x] in
  print("클로저 내부 값 :", x.number, y.number)
}
x.number = 5
y.number = 7
print("변경 값 :", x.number, y.number)

refCapture()
print("실행 이후 값 :", x.number, y.number)

//: # Binding an arbitrary expression
print("\n---------- [ binding ] ----------\n")
let captureBinding = { [z = x] in
  print(z.number)
}
let captureWeakBinding = { [weak z = x] in
  print(z?.number ?? 0)
}
let captureUnownedBinding = { [unowned z = x] in
  print(z.number)
}

captureBinding()
captureWeakBinding()
captureUnownedBinding()



/*:
 # Capture Example
 */
print("\n---------- [ Capture Example ] ----------\n")

func makeIncrementer(forIncrement amount: Int) -> () -> Int {
  var runningTotal = 0
  func incrementer() -> Int {
    runningTotal += amount
    return runningTotal
  }
  return incrementer
}

let incrementer = makeIncrementer(forIncrement: 7)
print(incrementer())
print(incrementer())
print(incrementer())

//: [Next](@next)

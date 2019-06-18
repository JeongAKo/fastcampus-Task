//: [Previous](@previous)
/*:
 # Type Conversion
 */

let height = Int8(5)
let width = 10
//let area = height * width
//print(area)


let h = UInt8(25)
let x = 10 * h
print(x)

/*:
 ---
 ## Question
 - 8번째 라인 let area = height * width  부분은 에러가 발생하고
 - 13번째 라인 let x = 10 * h 에서는 에러가 발생하지 않는 이유는?
 ---
 */

let num = 10
let floatNum = Float(num)
type(of: floatNum)

let signedInteger = Int(floatNum)
type(of: signedInteger)

let str = String(num)
type(of: str)



// magnitude, abs

let integer = Int(-15)

let magnitude = integer.magnitude
let absNum = abs(integer)


 type(of: magnitude)
 type(of: absNum)
/*:
 ---
 ## Question
 - magnitude 와 abs 의 차이점은?
 - 양수를 사용할 때 Int / UInt 중 어느 것이 좋을까?
   - 사용성, 안전성, 타입 추론, 변환 등
 ---
 */

//: [Next](@next)

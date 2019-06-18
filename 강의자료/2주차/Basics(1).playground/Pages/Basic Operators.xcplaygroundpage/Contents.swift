//: [Previous](@previous)
/*:
 # Basic Operators
 */
/*:
 ### 연산자 우선순위
 - [참고 링크1](https://developer.apple.com/documentation/swift/swift_standard_library/operator_declarations)
 - [참고 링크2](https://github.com/apple/swift-evolution/blob/master/proposals/0077-operator-precedence.md)
 */
/*:
 ---
 ## Terminology
 ---
 */
let a = 123
let b = 456
let c: Int? = 789

// Unary Operator (단항 연산자)
-a

// Prefix (전위 표기법)
-a

// Postfix (후위 표기법)
c!


// Binary Operator (이항 연산자)
a + b

// Infix (중위 표기법)
a + b


// Ternary Operator (삼항 연산자)
// Swift 에서 삼항 연산자는 단 하나
a > 0 ? "positive" : "negative"

//if a > 0 {
//  "positive"
//} else {
//  "negative"
//}


/*:
 ---
 ## Assignment Operators
 ---
 */

// Basic assignment operator
var value = 0

// Addition assignment operator
value = value + 10

// Subraction assignment operator
value = value - 5

// Multiplication assignment operator
value = value * 2

// Division assignment operator
value = value / 2

// Modulo assignment operator
value = value % 2

// Compound Assignment Operators
value += 10
value -= 5
value *= 2
value /= 2
value %= 2

// not support : value++ , value--

//value++
//value += 1
//value = value + 1

var (x, y) = (1, 2)
print(x, y)

/*:
 ---
 ## Arithmetic Operators
 ---
 */
// Unary plus opertor
+a

// Addition Operator
a + b

"Hello, " + "world"

// Unary minus Operator
-a

// Subtraction Operator
a - b

// Multiplication Operator
a * b

// Division Operator
b / a

// Modulo operator
b % a


// 실수에서의 나눗셈
let e = 123.4
let f = 5.678

// 나누기
e / f

// 나머지
//e % f

// 나머지1
e.remainder(dividingBy: f)

// 나머지2
e.truncatingRemainder(dividingBy: f)

/*:
 ---
 ## Question
 - 실수의 나머지를 구하는 방법 2가지의 차이점은?
 ---
 */



//let quotient1 = (e / f).rounded(.toNearestOrEven)
//let remainder1 = e.remainder(dividingBy: f)
//let sum1 = f * quotient1 + remainder1
//
//let quotient2 = (e / f).rounded(.towardZero)
//let remainder2 = e.truncatingRemainder(dividingBy: f)
//let sum2 = f * quotient2 + remainder2


/*:
 ---
 ## Precedence
 ---
 */

1 + 2 * 3
1 + (2 * 3)
(1 + 2) * 3

1 + 2 * 3 + 3
1 + (2 * 3) + 3
1 + 2 * (3 + 3)

1 * 2 - 3
(1 * 2) - 3
1 * (2 - 3)

/*:
 ---
 ## Comparison Operators
 ---
 */
// Equal to operator
a == b

// Not equal to operator
a != b

// Greater than operator
a > b

// Greater than or equal to operator
a >= b

// Less than operator
a < b

// Less than or equal to operator
a <= b


/*:
 ## Question
 - 숫자가 아닌 문자열에 대한 비교는?
 */

/*:
 ---
 ## Logical Operators
 ---
 */

// Logical AND Operator
true && true
true && false
false && true
false && false

// Logical OR Operator
true || true
true || false
false || true
false || false

// Logical Negation Operator
!true
!false


// Combining Logical Operators
let enteredDoorCode = true
let passedRetinaScan = false
let hasDoorKey = false
let knowsOverridePassword = true

// 우선순위 : && > ||

if enteredDoorCode && passedRetinaScan || hasDoorKey || knowsOverridePassword {
  print("Open the door")
} else {
  print("Can't open the door")
}

// Explicit Parentheses
if (enteredDoorCode && passedRetinaScan) || hasDoorKey || knowsOverridePassword {
  // ...
} else {
  // ...
}


/*:
 ## Question
 - 논리 연산자는 순서에 주의 필요. 순서를 신경 써야 하는 이유는?
 */

func returnTrue() -> Bool {
  print("function called")
  return true
}

// 아래 3개의 케이스에서 returnTrue 메서드는 각각 몇 번씩 호출될까?

print("\n---------- [ Case 1 ] ----------\n")
returnTrue() && returnTrue() && false || true && returnTrue() && returnTrue()

print("\n---------- [ Case 2 ] ----------\n")
returnTrue() && false && returnTrue() || returnTrue() || returnTrue()

print("\n---------- [ Case 3 ] ----------\n")
returnTrue() || returnTrue() && returnTrue() || false && returnTrue()


/*:
 ---
 ## Ternary Conditional Operator
 ---
 */

a > 0 ? "positive" : "zero or negative"

if a > 0 {
  "positive"
} else {
  "zero or negative"
}

/*:
 ---
 ## Range Operators
 ---
 */
print("\n---------- [ Range Operators ] ----------\n")

// Closed Range Operator
0...100

for index in 1...5 {
  print("\(index) times 5 is \(index * 5)")
}


// Half-Open Range Operator
0..<100

let names = ["Anna", "Alex", "Brin", "Jack"]
let count = names.count
for i in 0..<count {   // 0,1,2,3
  print("Person \(i + 1) is called \(names[i])")
}

// One-Sided Ranges
1...
...100
..<100


//               0       1        2       3
//let names = ["Anna", "Alex", "Brian", "Jack"]
names[2...]
names[...2]
names[..<2]


/*:
 ## Question
 - 범위 연산의 순서를 반대로(내림차순) 적용하려면?
 */
// Q. 아래 코드로 테스트
for index in (1...5).reversed() {
  print("\(index) times 5 is \(index * 5)")
}

//: [Next](@next)

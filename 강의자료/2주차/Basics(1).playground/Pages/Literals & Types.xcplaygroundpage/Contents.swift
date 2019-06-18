//: [Previous](@previous)
/*:
 # Literals & Types
 * 상수 - 고정된 값 (메모리 주소) 을 가지는 심볼/식별자
 * 리터럴
   - 소스코드에서 고정된 값으로 표현되는 문자 (데이터) 그 자체
   - 정수 / 실수 / 문자 / 문자열 / 불리언 리터럴 등
 */

/*:
 ---
 ## Numeric Literals
 ---
 */
var signedInteger = 123
signedInteger = +123
signedInteger = -123
type(of: signedInteger)

let decimalInteger = 17
let binaryInteger = 0b10001
type(of: binaryInteger)
let octalInteger = 0o21
let hexadecimalInteger = 0x11

var bigNumber = 1_000_000_000
bigNumber = 000_001_000_000_000
bigNumber = 0b1000_1000_0000
bigNumber = 0xAB_00_FF_00_FF

/*:
 ---
 ## Integer Types
 *  8-bit : Int8, UInt8
 * 16-bit : Int16, UInt16
 * 32-bit : Int32, UInt32
 * 64-bit : Int64, UInt64
 * Platform dependent : Int, UInt (64-bit on modern devices)
 ---
 */


var integer = 123
integer = -123
type(of: integer)

var unsignedInteger: UInt = 123 //UInt 양의 정수
//unsignedInteger = -123
type(of: unsignedInteger)


MemoryLayout<Int>.size // size 바이트 알려줌
Int.max
Int.min

MemoryLayout<UInt>.size
UInt.max
UInt.min

MemoryLayout<Int8>.size
Int8.max
Int8.min

MemoryLayout<UInt8>.size
UInt8.max
UInt8.min

MemoryLayout<Int16>.size
Int16.max
Int16.min

MemoryLayout<UInt16>.size
UInt16.max
UInt16.min

MemoryLayout<Int32>.size
Int32.max
Int32.min

MemoryLayout<UInt32>.size
UInt32.max
UInt32.min

MemoryLayout<Int64>.size
Int64.max
Int64.min

MemoryLayout<UInt64>.size
UInt64.max   // Playground Bug
UInt64.min
print(UInt64.max)   // 18,446,744,073,709,551,615


/*:
 ---
 ### Question
 - UInt에 음수를 넣으면?
 - Int8 에 127 을 초과하는 숫자를 넣으면?
 - Int 에 Int32.max ~ Int64.max 사이의 숫자를 넣었을 경우 생각해야 할 내용은?
 ---
 */

//let q1: UInt8 = -1

//let q2: Int8 = Int8.max + 1
//let q2: Int8 = 127 + 1
//let q2 = Int8(127 + 1)


//Int32.max
//Int64.max


// 64비트  아이폰5->32bit 운영체제
//let q3 = Int(Int32.max) + 1
//Int32.max + 1
//Int64.max + 1

/*:
 ---
 ## Overflow Operators
 ---
 */

// 아래 각 연산의 결과는?

// Overflow addition
//var add: Int8 = Int8.max + 1

//비트단위 2진수
// & 오버플로우 계산을 해준다.

var add: Int8 = Int8.max &+ 1

Int8.max &+ 1
Int32.max &+ 1
Int64.max &+ 1

// Overflow subtraction
//var subtract: Int8 = Int8.min - 1
var subtract: Int8 = Int8.min &- 1

Int8.min &- 1
Int32.min &- 1
Int64.min &- 1


// Overflow multiplication
//var multiplication: Int8 = Int8.max * 2
var multiplication: Int8 = Int8.max &* 2

Int8.max &* 2
Int32.max &* 2
Int64.max &* 2






// Overflow operator
// 01111111  1000000
// 10000000  0111111
// 01111111  1111110



/*:
 ## Floating-point Literal
 */
var floatingPoint = 1.23
floatingPoint = 1.23e4 // 1.23e-4
floatingPoint = 0xFp3
type(of: floatingPoint)

var floatingPointValue = 1.23
type(of: floatingPointValue)

var floatValue: Float = 1.23
type(of: floatValue)

MemoryLayout<Float>.size  //4bite
Float.greatestFiniteMagnitude   // FLT_MAX  *플로트의 표현방법*
Float.leastNormalMagnitude   // FLT_MIN

MemoryLayout<Double>.size  //8bite
Double.greatestFiniteMagnitude   // DBL_MAX
Double.leastNormalMagnitude   // DBL_MIN


/***************************************************
 Double - 최소 소수점 이하 15 자리수 이하의 정밀도
 Float - 최소 소수점 이하 6 자리수 이하의 정밀도
 부동 소수점이므로 소수점 이하의 정밀도는 변경 될 수 있음
 ***************************************************/

/*:
 ---
 ## Boolean Literal
 ---
 */
var isBool = true
type(of: isBool)

isBool = false
//isBool = False
//isBool = 1
//isBool = 0

let shouldChange: Bool = true
//shouldChange = false

/*:
 ---
 ## String Literal
 ---
 */
let str = "Hello, world!"
type(of: str)

let str1 = ""
type(of: str1)

var language: String = "Swift"

/*:
 ---
 ## Character Literal
 ---
 */

var nonCharacter = "C"
type(of: nonCharacter)

var character: Character = "C"
type(of: character)

MemoryLayout<String>.size
MemoryLayout<Character>.size

character = " "
type(of: character)


//character = 'ABC'

//character = ""
//character = "string"



/*:
 ---
 ## Typealias
 - 문맥상 더 적절한 이름으로 기존 타입의 이름을 참조하여 사용하고 싶을 경우 사용
 ---
 */
// typealias <#type name#> = <#type expression#>

typealias AudioSample = UInt16

var maxAmplitudeFound = AudioSample.min
var maxAmplitudeFound1 = UInt16.min

type(of: maxAmplitudeFound)
type(of: maxAmplitudeFound1)


/*:
 ---
 ### Question
 - Typealias 를 실제로 어떤 식으로 사용하고 있는지 직접 찾아보기
 ---
 */


//: [Next](@next)

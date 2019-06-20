//: [Previous](@previous)
import Foundation

/*:
 ---
 ## Array
 - Ordered Collection
 - Zero-based Integer Index
 ---
 */

/*:
 ### Mutable, Immutable
 */

var variableArray = [1, 2]
variableArray = []

let constantArray = [1, 2]
//constantArray = []

//var something = [2, 3]

/*:
 ### Array Type
 */

var arrayFromLiteral = [1, 2, 3]
arrayFromLiteral = []

//let emptyArray = []

//let emptyArray: [String] = []

/*:
 ### Initialize
 */

let strArray1: Array<String> = ["apple", "orange", "melon"]

let strArray2: [String] = ["apple", "orange", "melon"]

let strArray3 = ["apple", "orange", "melon"]

let strArray4 = Array<String>(repeating: "iOS", count: 5)

//let strArray5 = ["apple", 3.14, 1] as (any)


/*:
 ### Number of Elements
 */
let fruits = ["Apple", "Orange", "Banana"]
let countOfFruits = fruits.count


if !fruits.isEmpty {
  print("\(countOfFruits) element(s)")
} else {
  print("empty array")
}

let yummyfruits = ["mango", "melon", "berry"]
let countYF = yummyfruits.count

if !yummyfruits.isEmpty {
    print("과일 \(countYF)가 들어있다")
}else {
    print("비어있다")
}


/*:
 ### Retrieve an Element
 - [Int]
 - [Array.Index]
 - [a...b]
 - [a..<b]
 */
//              0        1         2
// fruits = ["Apple", "Orange", "Banana"]

//fruits[0]
//fruits[2]
//fruits[123]

fruits.startIndex
//fruits.endIndex   -> 마지막 인덱스 다음에 오는 위치 so 마지막 위치 소환하고 싶으면 -1 하기


fruits[fruits.startIndex]
fruits[fruits.endIndex - 1]


fruits.startIndex == 0    //
fruits.endIndex - 1 == 2  //

// "11".startIndex == 0

/*:
 ### Searching
 */
print("\n---------- [ Searching ] ----------\n")

let alphabet = ["A", "B", "C", "D", "E"]

if alphabet.contains("A") {
  print("contains A")
}

if alphabet.contains(where: { str -> Bool in
  // code...
  return str == "A"
}) {
  print("contains A")
}

//if let index = alphabet.firstIndex(of: "D") {
//  print("index of D: \(index)")
//}
if let index = alphabet.firstIndex(of: "D") {
    print("index of D: \(index)")
}



//let idx1 = alphabet.firstIndex(of: "D")
//print(idx1)

//let idx2 = alphabet.firstIndex(of: "Q")
//print(idx2)


/*:
 ### Add a new Element
 */

//var alphabetArray: Array<String> = []
//var alphabetArray: [String] = []
//var alphabetArray = [String]()
var alphabetArray = ["A"]
alphabetArray.append("B")
alphabetArray += ["C"]
alphabetArray

var alphabetArray2 = ["Q", "W", "E"]
alphabetArray + alphabetArray2

//alphabetArray.append(5.0)
//alphabetArray + 1

alphabetArray.insert("S", at: 0)
alphabetArray.insert("F", at: 3)
alphabetArray

/*:
 ### Change an Existing Element
 */

alphabetArray = ["A", "B", "C"]
alphabetArray[0] = "Z"
alphabetArray

alphabetArray = ["A", "B", "C"]

alphabetArray[alphabetArray.startIndex ..< alphabetArray.endIndex.advanced(by: -1)] = ["X", "Y"]
alphabetArray



1...5
1..<5
1...

alphabetArray = ["A", "B", "C", "D", "E", "F"]
alphabetArray[2...] = ["Q", "W", "E", "R"]
alphabetArray


alphabetArray[2...] = ["Q", "W"]
//alphabetArray


/*:
 ### Remove an Element
 */

alphabetArray = ["A", "B", "C", "D", "E"]

let removed = alphabetArray.remove(at: 0)
alphabetArray

alphabetArray.removeAll()
alphabetArray.removeAll(keepingCapacity: true)

// index 찾아 지우기
alphabetArray = ["A", "B", "C", "D", "E"]

if let indexC = alphabetArray.firstIndex(of: "C") {
  alphabetArray.remove(at: indexC)
}
alphabetArray


/*:
 ### Sorting
 */

alphabetArray = ["A", "B", "C", "D", "E"]
alphabetArray.shuffle()
alphabetArray

// Shuffle - Swift 4.2 이전
for i in 0 ..< (alphabetArray.count - 1) {
  let j = Int(arc4random_uniform(UInt32(alphabetArray.count)))
  alphabetArray.swapAt(i, j)
}
alphabetArray


// sorted vs sort

//public func sorted() -> [Element]
//public mutating func sort()

var sortedArray = alphabetArray.sorted()
sortedArray
alphabetArray

alphabetArray.sort()
alphabetArray


// sort by closure syntax

sortedArray = alphabetArray.sorted { $0 > $1 }
alphabetArray.sorted(by: >= )
sortedArray

alphabetArray.sort { $0 > $1 }
alphabetArray


/*:
 ### Enumerating an Array
 */
// 배열의 인덱스와 내용을 함께 알고 싶을 때

let array = ["Apple", "Orange", "Melon"]

for value in array {
  if let index = array.index(of: value) {
    print("\(index) - \(value)")
  }
}


for value2 in array {
    if let index = array.index(of:value2){
        print ("\(index) -\(value2)")
    }
}



print("\n---------- [ enumerated ] ----------\n")

for tuple in array.enumerated() {
  print("\(tuple.0) - \(tuple.1)")
//  print("\(tuple.offset) - \(tuple.element)")
}

for (index, word) in array.enumerated() {
  print("\(index) - \(word)")
} // 이거를 자주 씀


print("\n---------- [ reversed ] ----------\n")

for value in array.reversed() {
  if let index = array.index(of: value) {
    print("\(index) - \(value)")
  }
}



/*:
 ---
 ### Question
 - ["p", "u", "p", "p", "y"] 라는 값을 가진 배열에서 마지막 "p" 문자 하나만 삭제하기
 - 정수 타입의 배열을 2개 선언하고 두 배열의 값 중 겹치는 숫자들로만 이루어진 배열 만들기
 - 정수 타입의 배열을 선언하고 해당 배열 요소 중 가장 큰 값을 반환하는 함수
 ---
 */
// 1번 문제

//var alpa = ["p", "u", "p", "p", "y"]
//
//if let ind =  alpa.lastIndex(of: "p"){
//        alpa.remove(at: ind)
//}
//alpa

var puppy = ["p", "u", "p", "p", "y"]

if let ind = puppy.lastIndex(of: "p"){
puppy.remove(at: ind)
}
puppy



// 2번 문제
// ex) [1, 2, 4, 8, 9, 12, 13] , [2, 5, 6, 9, 13]  -->  [2, 9, 13]

let aArray = [1, 2, 4, 8, 9, 12, 13]
let bArray = [2, 5, 6, 9, 13]

var result2: [Int] = []

for i in aArray {
    for j in bArray{
        if i == j{
            result2.append(j)
        
        }
    }
}

result2

// 3번 문제
// ex) [50, 23, 29, 1, 45, 39, 59, 19, 15] -> 59





/*:
 ---
 ### Answer
 ---
 */

print("\n---------- [ Answer ] ----------\n")

/***************************************************
 ["p", "u", "p", "p", "y"] 라는 배열에서 마지막 "p" 문자 하나만 삭제하기
 ***************************************************/
/***************************************************
 정수 타입의 배열을 2개 선언하고 두 배열의 값 중 겹치는 숫자들로만 이루어진 배열 만들기
 ex) [1, 2, 4, 8, 9, 12, 13] , [2, 5, 6, 9, 13]  -->  [2, 9, 13]
 ***************************************************/

let firstArray = [1, 2, 4, 8, 9, 12, 13]
let secondArray = [2, 5, 6, 9, 13]

var result: [Int] = []

for i in firstArray {
  for j in secondArray {
    if i == j {
      result.append(j)
    }
  }
}

result



/***************************************************
 정수 타입의 배열을 선언하고 해당 배열 요소 중 가장 큰 값을 반환하는 함수 만들기
 ex) [50, 23, 29, 1, 45, 39, 59, 19, 15] -> 59
 ***************************************************/

// 1) Swift 에서 제공하는 기본 함수인 max() 를 이용하는 방법
let arr = [50, 23, 29, 1, 45, 39, 59, 19, 15]
arr.max()


// 2) 두 수 중 높은 값을 반환하는 max 를 이용하거나, 3항 연산자를 이용하는 방법
func maximumValue(in list: [Int]) -> Int {
  var maxValue = Int.min
  for number in list {
    maxValue = max(maxValue, number)
    Equatable.self
    
    // 위 함수는 다음의 3항 연산자와 동일
    // maxValue = maxValue < number ? number : maxValue
  }
  return maxValue
}

maximumValue(in: [50, 23, 29, 1, 45, 39, 59, 19, 15])
maximumValue(in: [10, 20, 30, 80, 50, 40])
maximumValue(in: [-6, -5, -4, -3, -2, -1])



//: [Next](@next)

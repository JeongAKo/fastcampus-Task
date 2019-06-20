//: [Previous](@previous)
import Foundation

/*:
 ## Dictionary
 - Element = Unique Key + Value
 - Unordered Collection
 */

/*:
 ### Dictionary Literal
 */


//var dictFromLiteral = ["key 1": "value 1", "key 2": "value 2"]
//var dictFromLiteral = [1: "value 1", 2: "value 2"]
var dictFromLiteral = ["1": 1, "2": 2]

//var dictFromLiteral = [:]
dictFromLiteral = [:]

/*:
 ### Dictionary Type
 */
let words1: Dictionary<String, String> = ["A": "Apple", "B": "Banana", "C": "City"]
let words2: [String: String] = ["A": "Apple", "B": "Banana", "C": "City"]
let words3 = ["A": "Apple", "B": "Banana", "C": "City"]

/*:
 ### Number of Elements
 */
print("\n---------- [ Number of Elements ] ----------\n")

var words = ["A": "Apple", "B": "Banana", "C": "City"]
let countOfWords = words.count

if !words.isEmpty {
  print("\(countOfWords) element(s)")
} else {
  print("empty dictionary")
}

/*:
 ### Retrieve an Element
 */
print("\n---------- [ Retrieve ] ----------\n")

//words["A"]
//print(words["A"])
//
//words["Q"]
//print(words["Q"])


if let aValue = words["A"] {
  print(aValue)
} else {
  print("Not found")
}

if let zValue = words["Z"] {
  print(zValue)
} else {
  print("Not found")
}

print(words.keys)
print(words.values)

let keys = Array(words.keys)
let values = Array(words.values)


/*:
 ### Searching
 */
print("\n---------- [ Searching ] ----------\n")

//var words = ["A": "Apple", "B": "Banana", "C": "City"]

if words.contains(where: { (key, value) -> Bool in
  return key == "A"
  }){
  print("contains A key.")
}
if words.contains(where: { (dict) -> Bool in
  return dict.value.lowercased() == "City".lowercased()
}) {
  print("contains City value.")
}

if words.contains(where: { $0.1.lowercased() == "City".lowercased() }) {
  print("contains City value.")
}

let filteringResult = words.filter { (key, value) -> Bool in
  return value.lowercased().contains("a")
}


for (key, value) in filteringResult {
  print("\(key) - \(value)")
}

/*:
 ### Add a New Element
 */
words = ["A": "A"]

words["A"]    // Key -> Unique

words["A"] = "Apple"
words

words["B"] = "Banana"
words

words["B"] = "Blue"
words


/*:
 ### Change an Existing Element
 */
print("\n---------- [ Change ] ----------\n")

words = [:]
words["A"] = "Application"
words

words["A"] = "App"
words


// 기존에 키가 없으면 데이터 추가 후 nil 반환, 키가 있었다면 데이터 업데이트 후 oldValue 반환
if let oldValue = words.updateValue("Apple", forKey: "A") {
  print("\(oldValue) => \(words["A"]!)")
} else {
  print("+ \(words["A"]!)")
}
words

if let oldValue = words.updateValue("Steve Jobs", forKey: "S") {
  print("\(oldValue) => \(words["A"]!)")
} else {
  print("+ \(words["A"]!)")
}
words

/*:
 ### Remove an Element
 */
print("\n---------- [ Remove ] ----------\n")

words = ["A": "Apple", "I": "IPhone", "S": "Steve Jobs"]
words["S"] = nil
words["Z"] = nil
words

words = ["A": "Apple", "I": "IPhone", "S": "Steve Jobs", "T": "Timothy Cook"]

// 지우려는 키가 존재하면 데이터를 지운 후 지운 데이터 반환, 없으면 nil
if let removedValue = words.removeValue(forKey: "T") {
  print("\(removedValue) removed!")
}

words.remove(at: words.startIndex)
words

words.removeAll()



/*:
 ### Enumerating an Dictionary
 */
print("\n---------- [ Enumerating ] ----------\n")

let dict = ["A": "Apple", "B": "Banana", "C": "City"]

for (key, value) in dict {
  print("\(key): \(value)")
}

for (key, _) in dict {
  print("Key :", key)
}

for (_, value) in dict {
  print("Value :", value)
}



/*:
 ### Nested
 */
print("\n---------- [ Nested ] ----------\n")

var dict1 = [String: [String]]()
//dict1["arr"] = "A"
dict1["arr1"] = ["A", "B", "C"]
dict1["arr2"] = ["D", "E", "F"]
dict1


var dict2 = [String: [String: Int]]()
dict2["dict1"] = [
  "name": 1,
  "age": 2,
]
dict2["dict2"] = [
  "name": 5,
  "age": 3,
]
dict2







/*:
 ---
 ### Question
 - Dictionary로 저장되어 있는 시험 성적의 평균 점수 구하기
 - Dictionary로 저장된 scores 데이터를 튜플 타입을 지닌 배열로 변환하여 저장하기
 - 주어진 자료를 보고 Dictionary 자료형에 맞게 데이터를 변수에 저장하기
 - 위 문제에서 정의한 변수의 데이터 중 스쿨 배열에 저장된 첫번째 데이터를 꺼내어 출력하기
 ---
 */

// 1번 문제
 let scores = ["kor": 92,"eng": 88, "math": 96, "science": 89]
// 결과 : 91.25
var sum = 0
    for i in scores.values {
        sum += i
    }
  print( Double(sum) / Double(scores.values.count))




// 2번 문제
// let scores = ["kor": 92,"eng": 88, "math": 96, "science": 89]




// 결과 : [("kor", 92), ("eng", 88), ("math", 96), ("science", 89)]

// 3번 문제
/***************************************************
 패스트캠퍼스
  - 스쿨            키
   * iOS 스쿨       어레이
   * 백엔드 스쿨
   * 프론트엔드 스쿨
  - 캠프
   * A 강의
   * B 강의
  - 온라인
   * C 강의
   * D 강의
 ***************************************************/

// 4번 문제
// 자세한 내용은 Optional 시간에 배울 예정


/*:
 ---
 ### Answer
 ---
 */

// Dictionary 로 저장되어 있는 시험 성적의 평균 점수 구하기




// Dictionary로 저장된 scores 데이터를 튜플 타입을 지닌 배열로 변환하여 저장하기
var scoreArr: [(String, Int)] = []

for (key, value) in scores {
  scoreArr.append((key, value))
}

//for dict in scores {
//  scoreArr.append(dict)
//}

//scoreArr = Array(scores)

scoreArr




// 주어진 자료를 보고 Dictionary 자료형에 맞게 데이터를 변수에 저장하기

/***************************************************
 패스트캠퍼스
  - 스쿨
    * iOS 스쿨
    * 백엔드 스쿨
    * 프론트엔드 스쿨
  - 캠프
    * A 강의
    * B 강의
  - 온라인
    * C 강의
    * D 강의
 ***************************************************/

let dic = [
    "식뮥목": [
        "개과":[
            "개":[
                "자칼",
                "늑대",
                "북한산이리"],
            "여우":[
                "아메리카여우",
                "유럽여우"]],
        "고양이과": [
            "고양이": [
                "고양이",
                "살쾡이"],
            "표범":[
                "사자",
                "호랑이"]
        ]
    ]
]


// 위 문제에서 정의한 변수의 데이터 중 스쿨 배열에 저장된 첫번째 데이터를 꺼내어 출력하기
// 자세한 내용은 Optional 시간에 배울 예정

if let 패캠 = fastcampus["패스트캠퍼스"] {
  if let 스쿨 = 패캠["스쿨"] {
    print(스쿨[0])
  }
}

if let 패캠 = fastcampus["패스트캠퍼스"], let 스쿨 = 패캠["스쿨"], let iOS = 스쿨.first {
  print(iOS)
}

print(fastcampus["패스트캠퍼스"]!["스쿨"]![0])




//: [Next](@next)

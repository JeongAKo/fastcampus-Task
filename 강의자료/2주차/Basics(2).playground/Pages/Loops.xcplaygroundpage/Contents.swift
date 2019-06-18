//: [Previous](@previous)
/*:
 # Loops
 - For-In Loops
 - While Loops
   - while
   - repeat-while
 */
/*:
 ---
 ## For-In Loops
 ---
 */
print("\n---------- [ for ] ----------\n")
/***************************************************
 for <#item#> in <#items#> {
 <#code#>
 }
 ***************************************************/

//for (int i = 0; i <= 5; i++) {
//   C 스타일의 for 문
//}

for index in 1...4 {
  print("\(index) times 5 is \(index * 5)")
}

// Wildcard Pattern * 와일드카드 패턴!!!

for _ in 0...3 {
  print("hello")
}

// 디폴드 값 terminaor "\n"
for chr in "Hello" {
  print(chr, terminator: " ")
}
print()

let list = ["Swift", "Programming", "Language"]
for str in list {
  print(str)
}


/*:
 ---
 ### Question
 - for 문을 이용하여 3 의 10 제곱에 대한 결과값을 표현하는 코드 구현
 - for 문을 이용하여 10부터 1까지 내림차순으로 출력하는 코드 구현
 ---
 */
// for 문을 이용하여 3 의 10 제곱에 대한 결과값을 표현하는 코드 구현  *횟수를 지정*
let base = 3
let power = 10
var answer = 1

for _ in 1...power {
    answer *= base
    
    //*=는 양쪽에 곱을한 값을 왼쪽에다가 놔둔다
}
print("\(base) to the power of \(power) is \(answer)")



// for 문을 이용하여 10부터 1까지 내림차순으로 출력하는 코드 구현


for i in (1...10).reversed() {
    print (i, terminator: " ")
}

print()

/*:
 ---
 ## While Loops
 - 조건이 거짓이 될 때까지 일련의 명령문 수행
 - 첫 번째 반복이 시작되기 전에 반복 횟수를 알지 못할 때 많이 사용
 - while  /  repeat-while
 ---
 */
print("\n---------- [ while ] ----------\n")
/***************************************************
 while <#condition#> {
 <#code#>
 }

 - 루프를 통과하는 각 패스의 시작 부분에서 조건을 평가
 ***************************************************/

var num = 0
var sum = 0

while num <= 100 {
  sum += num
  num += 1
}

sum

/*:
 ---
 ### Question
 - 2 ~ 9 사이의 숫자를 입력받아 해당 숫자에 해당하는 구구단 내용을 출력하는 함수
 ---
 */


/***************************************************
 repeat {
 <#code#>
 } while <#condition#>
 
 - 루프를 통과하는 각 패스의 끝 부분에서 조건을 평가
 - 다른 언어에서는 do - while 문으로 많이 사용
 ***************************************************/

print("\n---------- [ repeat ~ while ] ----------\n")

func printMultiplicationTable1(for number: Int) {
  var i = 1
  repeat {
    print("\(number) * \(i) = \(number * i)")
    i += 1
  } while i <= 9
}

printMultiplicationTable1(for: 3)

/*:
 ---
 ### Question
 - 자연수 하나를 입력받아 1부터 해당 숫자 사이의 모든 숫자의 합을 구해 그 합을 반환하는 함수
 ---
 */


/*:
 ---
 ### Answer
 ---
 */

// for 문을 이용하여 3 의 10 제곱에 대한 결과값을 표현하는 코드 구현

let base1 = 3
let power1 = 10
var answer1 = 1

for _ in 1...power1{
  answer1 *= base1
}
print("\(base1) to the power of \(power1) is \(answer1)")



// for 문을 이용하여 10부터 1까지 내림차순으로 출력하는 코드 구현
for num in (1...10).reversed() {
  print(num, terminator: " ")
}
print()


// 2 ~ 9 사이의 숫자를 입력받아 해당 숫자에 해당하는 구구단 내용을 출력하는 함수
func printMultiplicationTable(for number: Int) {
  var i = 1
  while i <= 9 {
    print("\(number) * \(i) = \(number * i)")
    i += 1
  }
}

printMultiplicationTable(for: 3)


// 자연수 하나를 입력받아 1부터 해당 숫자 사이의 모든 숫자의 합을 구해 그 합을 반환하는 함수
func sumNumbers(max: Int) -> Int {
  var num = 1
  var sum = 0
  repeat {
    sum += num
    num += 1
  } while num <= max
  
  return sum
}

sumNumbers(max: 10)
sumNumbers(max: 50)
sumNumbers(max: 100)

//: [Next](@next)

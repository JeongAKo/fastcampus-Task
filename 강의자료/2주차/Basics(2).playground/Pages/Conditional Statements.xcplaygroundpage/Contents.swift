//: [Previous](@previous)
/*:
 # Conditional Statements
 */

/*:
 ---
 ## if Statements
 ---
 */
/***************************************************
 if <#condition#> {
   <#code#>
 }
 
 if <#condition#> {
   <#statements#>
 } else {
   <#statements#>
 }
 
 - condition 은 Bool 값 (true, false)
 ***************************************************/

// if

var temperatureInFahrenheit = 30

if temperatureInFahrenheit <= 32 {
  print("It's very cold. Consider wearing a scarf.")
}


// if - else

temperatureInFahrenheit = 40

if temperatureInFahrenheit <= 32 {
  print("It's very cold. Consider wearing a scarf.")
} else {
  print("It's not that cold. Wear a t-shirt.")
}


// if - else if - else

temperatureInFahrenheit = 90

if temperatureInFahrenheit <= 32 {
  print("It's very cold. Consider wearing a scarf.")
} else if temperatureInFahrenheit >= 86 {
  print("It's really warm. Don't forget to wear sunscreen.")
} else {
  print("It's not that cold. Wear a t-shirt.")
}


// if - else if

temperatureInFahrenheit = 72
if temperatureInFahrenheit <= 32 {
  print("It's very cold. Consider wearing a scarf.")
} else if temperatureInFahrenheit >= 86 {
  print("It's really warm. Don't forget to wear sunscreen.")
}


// Logical And Operator
if (temperatureInFahrenheit > 0) && (temperatureInFahrenheit % 2 == 0) {
}

// Logical And Operator AND는 콤마로 대체할 수 있다
if temperatureInFahrenheit > 0, temperatureInFahrenheit % 2 == 0 {
}

/*:
 ---
 ### Question
 - if ~ else if   /  if 문을 2개 하는 것과 차이점?
 - if ~ else if 만 있을 때 else 없이 동일하게 처리하려면?
 ---
 */

// 1번
var number = 9
if number < 10 {
  print("10보다 작다")
} else if number < 20 {
  print("20보다 작다")
}

if number < 10 {
  print("10보다 작다")
}
if number < 20 {
  print("20보다 작다")
}



// 2번
number = 25
if number < 10 {
  print("10보다 작다")
} else if number < 20 {
  print("20보다 작다")
} else {
  print("20과 같거나 크다")
}


if number < 10 {
  print("10보다 작다")
} else if number < 20 {
  print("20보다 작다")
} else if number >= 20 {
  print("20과 같거나 크다")
}




/*:
 ---
 ## switch Statements
 ---
 */
/***************************************************
 switch <#value#> {
 case <#value 1#>:
     <#respond to value 1#>
 case <#value 2#>,
      <#value 3#>:
     <#respond to value 2 or 3#>
 default:
     <#otherwise, do something else#>
 }
 
 - switch 문은 가능한 모든 사례를 반드시 다루어야 함 (Switch must be exhaustive) 
 ***************************************************/

print("\n---------- [ switch statements ] ----------\n")

let alphabet: Character = "b"

switch alphabet {
case "a","A":
  print("The first letter of the alphabet")
case "z":
  print("The last letter of the alphabet")
default:
print("연습")
  
//  Invalid, the case has an empty body
//  print("Some other character")
}


// Without default case

let isTrue = false

switch isTrue {
case true:
  print("true")
case false:
  print("false")
}



// Interval Matching

print("\n---------- [ Interval Matching ] ----------\n")

let approximateCount = 30

switch approximateCount {
case 0...50:
  print("0 ~ 50")
case 51...100:
  print("51 ~ 100")
default:
  print("Something else")
}


/*:
 ---
 ### Question
 - 아래의 if - else if - else 문을 switch 문으로 바꿔보세요.
 ---
 */
/***************************************************
 if temperatureInFahrenheit <= 32 {
 print("It's very cold. Consider wearing a scarf.")
 } else if temperatureInFahrenheit >= 86 {
 print("It's really warm. Don't forget to wear sunscreen.")
 } else {
 print("It's not that cold. Wear a t-shirt.")
 }
 
 ***************************************************/


var tem = 30

switch tem {
case ...32:
    print ("It's very cold. Consider wearing a scarf.")
case ...86:
    print ("It's really warm. Don't forget to wear sunscreen.")
default:
    print ("It's not that cold. Wear a t-shirt.")
}


// Compound Cases

let someCharacter: Character = "e"

switch someCharacter {
case "a", "e", "i", "o", "u":
  print("\(someCharacter) is a vowel")
case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m",
     "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z":
  print("\(someCharacter) is a consonant")
default:
  print("\(someCharacter) is not a vowel or a consonant")
}



// value binding

let somePoint = (0, 11)

switch somePoint {
case (let distance, 0), (0, let distance):
  print("On an axis, \(distance) from the origin")
default:
  print("Not on an axis")
}


// where clause

let anotherPoint = (1, -1)
switch anotherPoint {
case let (x, y) where x == y:
  print("(\(x), \(y)) is on the line x == y")
case let (x, y) where x == -y:
  print("(\(x), \(y)) is on the line x == -y")
case let (x, y):
  print("(\(x), \(y)) is just some arbitrary point")
}


// fallthrough

print("\n---------- [ fallthrough ] ----------\n")
let integerToDescribe = 5
var description = "The number \(integerToDescribe) is"

switch integerToDescribe {
case 2, 3, 5, 7, 11, 13, 17, 19:
  description += " a prime number, and also"
  fallthrough
default:
  description += " an integer."
}
print(description)

/*:
 ---
 ### Question
 - 나이를 입력받아 1 이상 100 이하일 때만 "Update" 라는 문자열을 출력하는 함수 (if 문, switch 문 각각)
 ---
 */
func mesg(num:Int) -> String {
    switch num {
    case 1...100:
        return "Update"
    default:
        return "유지"
    }
}
print(mesg(num: 30))



func mesage(numn:Int) {
    if 1...100 ~= numn  {
        print("update")
    } else{
        print("종료")
    }
}
mesage(numn: 110)

/*
let age = 23
if age >=1 , age <= 100
print "update"
*/
/*:
 ---
 ## Early Exit
 - guard statement
 ---
 */
/***************************************************
 if <#condition#> {
 <#code#>
 } else if condition {
 <#code#>
 }
 - 특정 조건을 만족하면 해당 분기문 실행
//
 guard <#condition#> else {
 <#code#>
 }
 - 조건에 맞지 않으면 바로 종료.
 - 들여쓰기 중첩 방지
 ***************************************************/



//func update(age: Int) {
//  switch age {
//  case 1...100: print("Update")
//  default: break
//  }
//}

//func update(age: Int) {
//  guard 1...100 ~= age else { return }
//  print("Update")
//}
//
//update(age: -1)
//update(age: 2)
//update(age: 100)


// Exercise 문제 풀기


/*:
 ---
 ### Answer
 ---
 */
print("\n---------- [ Answer ] ----------\n")

// if - else if - else 문을 switch 문으로 바꿔보세요.
switch temperatureInFahrenheit {
case ...32:
  print("It's very cold. Consider wearing a scarf.")
case 86...:
  print("It's really warm. Don't forget to wear sunscreen.")
default:
  print("It's not that cold. Wear a t-shirt. ")
}


// 어떤 숫자가 주어졌을 때 짝수인지 홀수인지 출력 (switch의 where 절 이용)

let even = 5
switch even {
case let x where x % 2 == 0:
  print("\(x)는 짝수")
    
default:
    print("\(x)는 홀수")
    
}



//
//func which(num9:Int) -> String{
//    switch num9 {
//    case let X where X % 2 == 1 :
//        return "\(X)는 홀수입니다"
//    default:
//        return "\(X)는 짝수입니다"
//    }
//
//}
//print(which(num9: 5))
//






//: [Next](@next)

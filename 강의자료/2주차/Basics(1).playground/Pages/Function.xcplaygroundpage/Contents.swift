//: [Previous](@previous)
/*:
 # Function
 - Functions are self-contained chunks of code that perform a specific task
 - 일련의 작업을 수행하는 코드 묶음을 식별할 수 있는 특정한 이름을 부여하여 사용하는 것
 - 유형
   - Input 과 Output 이 모두 있는 것 (Function)
   - Input 이 없고 Output 만 있는 것 (Generator)
   - Input 이 있고 Output 은 없는 것 (Consumer)
   - Input 과 Output 이 모두 없는 것
 */

/*:
 ## Function Syntax
 ![Function Syntax](func.png)
 
 ### Parameter Declaration Syntax
 ![Parameters](param.png)
*/

/*:
 ---
 ## Functions without parameters
 ---
 */
print("\n---------- [ Functions without parameters ] ----------\n")

print("Hello, world!")

func hello1() {
  print("Hello, world!")
}

func hello2() -> String {
  return "Hello, world!"
}

hello1()
print(hello2())

/*:
 ---
 ## Functions without return values
 ---
 */
print("\n---------- [ Functions without return values ] ----------\n")

func say(number: Int) {
  print(number)
}

func say(word: String) -> Void {
  print(word)
}

func say(something: String) -> () {
  print(something)
}

say(number: 1)
say(word: "1")
say(something: "1")


/*:
 ---
 ## Functions with params and return values
 ---
 */
print("\n---------- [ Functions with params and return values ] ----------\n")

func greet(person: String) -> String {
  let greeting = "Hello, " + person + "!"
  return greeting
}

greet(person: "Anna")
greet(person: "Brian")



// Combine the message creation and the return statement into one line

func greetAgain(person: String) -> String {
  return "Hello again, " + person + "!"
}

greetAgain(person: "Anna")



// Function with Multiple Parameters

func addNumbers(a: Int, b: Int) -> Int {
  return a + b
}

addNumbers(a: 10, b: 20)
addNumbers(a: 3, b: 5)


/*:
 ---
 ## Argument Label
 
 ### Argument Label Declaration Syntax
 
 ![Argument Label](arg-label.png)
 
 ### Calling Function with Argument Label
 ![Calling Function with Argument Label](arg-call.png)
 */
print("\n---------- [ Argument Label ] ----------\n")

// Function Argument Labels and Parameter Names

// By default, parameters use their parameter name as their argument label.

func someFunction(firstParameterName: Int, secondParameterName: Int) {
  print(firstParameterName, secondParameterName)
}

someFunction(firstParameterName: 1, secondParameterName: 2)



// Omitting Argument Labels

func someFunction(_ firstParameterName: Int, secondParameterName: Int) {
  print(firstParameterName, secondParameterName)
}

//someFunction(firstParameterName: 1, secondParameterName: 2)
someFunction(1, secondParameterName: 2)



// Specifying Argument Labels

func someFunction(argumentLabel parameterName: Int) {
  // parameterName refers to the argument value for that parameter.
  print(parameterName)
}

someFunction(argumentLabel: 10)



/*:
 ---
 ### Question
 - 이름을 입력 값으로 받아서 출력하는 함수 (기본 형태)
 - 나이를 입력 값으로 받아서 출력하는 함수 (Argument Label 생략)
 - 이름을 입력 값으로 받아 인사말을 출력하는 함수 (Argument Label 지정)
 ---
 */



func name (person: String) -> String {
    let name =  "안녕하세요 " + person + " 씨!"
    return name
}

name (person: "Anna")
name (person: "Brian")



/*:
 ---
 ### Question.
 - Argument Label을 생략하는 건 어떤 경우인가요
 - Argument Label을 별도로 지정하는 건 어떤 경우인가요
 ---
 */



// Default Parameter Values

func functionWithDefault(
  paramWithoutDefault: Int,
  paramWithDefault: Int = 12
  ) -> Int {
  return paramWithDefault
}

functionWithDefault(paramWithoutDefault: 3, paramWithDefault: 6)
// parameterWithDefault is 6

functionWithDefault(paramWithoutDefault: 4)
// parameterWithDefault is 12



// Variadic Parameters
// variadic parameters cannot be marked as inout.

func arithmeticAverage(_ numbers: Double...) -> Double {
  var total = 0.0
  for number in numbers {
    total += number
  }
  return total / Double(numbers.count)
}

arithmeticAverage(1, 2, 3, 4, 5)
arithmeticAverage(3, 8.25, 18.75)

//print(10,20,30,40,50)
//print(1,2,3,4,5,6,7)

/*:
 ---
 ### Question
 - 위 arithmeticAverage 함수에 추가로 다른 파라미터를 하나 더 입력받아 결과를 구하는 함수
 ---
 */

func arithmeticAverage(_ numbers: Double..., and last: Double) {
    type(of: numbers)
    print("number: ", numbers)
    print("last: ", last)
}

arithmeticAverage(1, 2, 3, 1, 2, 3, 34, 4, 4, 55, 5, and: 5)


//func arithmeticAverage(_ numbers: Double..., and last: Double) {
//  print(numbers)
//  print(last)
//}
//
//arithmeticAverage(1, 2, 3, and: 5)


/*:
 ## Argument vs Parameter
 
 ![argparam](arg-param.png)
 - Parameter
   - 매개변수 = 인자 = Parameter
   - 인수를 담는 변수의 한 종류로서 해당 함수 내부 스코프에만 영향
   - 대부분 call by value 가 기본
   - call by reference 는 호출할 때 사용한 전달인자에까지 영향
 - Argument
   - 전달인자 = 인수 = 실인수 = Argument
   - 함수 호출 시 그에 필요한 데이터를 전달
 */

/*:
 ---
 ## Nested Functions
 - 외부에는 숨기고 함수 내부에서만 사용할 함수를 중첩하여 사용 가능
 ---
 */
func chooseStepFunction(backward: Bool, value: Int) -> Int {
  func stepForward(input: Int) -> Int {
    return input + 1
  }
  func stepBackward(input: Int) -> Int {
    return input - 1
  }
  
  if backward {
    return stepBackward(input: value)
  } else {
    return stepForward(input: value)
  }
}


var value = 4
chooseStepFunction(backward: true, value: value)
chooseStepFunction(backward: false, value: value)





/*:
 ---
 ### Answer
 ---
 */

func print(name: String) {
  print(name)
}
print(name: "Tory")


func printAge(_ age: Int) {
  print(age)
}
printAge(4)


func sayHello(to name: String) {
  print(name)
}
sayHello(to: "Lilly")

//: [Next](@next)
  

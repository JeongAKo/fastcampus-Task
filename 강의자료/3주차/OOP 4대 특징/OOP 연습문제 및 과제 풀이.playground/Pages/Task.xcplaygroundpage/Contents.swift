//: [Previous](@previous)

import Foundation

/***************************************************
 다음과 같은 속성(Property)과 행위(Method)를 가지는 클래스 만들어보기.
 구현 내용은 자유롭게
 
 ** 강아지 (Dog)
 - 속성: 이름, 나이, 몸무게, 견종
 - 행위: 짖기, 먹기
 
 ** 학생 (Student)
 - 속성: 이름, 나이, 학교명, 학년
 - 행위: 공부하기, 먹기, 잠자기
 
 ** 아이폰(IPhone)
 - 속성: 기기명, 가격, faceID 기능 여부(Bool)
 - 행위: 전화 걸기, 문자 전송
 
 ** 커피(Coffee)
 - 속성: 이름, 가격, 원두 원산지
 ***************************************************/

class Dog {
  let name = "Tory"
  let age = 3
  let weight = 6
  let type = "Poodle"
  
  func cry() {
    print("Cry")
  }
  func eat() {
    print("Eat")
  }
}


class Student {
  let name = "세종대왕"
  let age = 20
  let school = "조선대학교"
  let grade = "1학년"
  
  func study() {
    print("Study")
  }
  func eat() {
    print("Eat")
  }
  func sleep() {
    print("Sleep")
  }
}


class IPhone {
  let deviceName = "iPhone X"
  let price = 1_000_000
  let hasFaceID = true
  
  func call(to callee: String) {
    print(callee + "에게 전화")
  }
  func sendSMS(to receiver: String) {
    print(receiver + "에게 문자")
  }
}



class Coffee {
  let name = "아메리카노"
  let price = 3_500
  let origin = "에티오피아"
}





/***************************************************
 계산기 클래스를 만들고 다음과 같은 기능을 가진 Property 와 Method 정의해보기
 
 ** 계산기 (Calculator)
 - 속성: 현재 값
 - 행위: 더하기, 빼기, 나누기, 곱하기, 값 초기화
 ***************************************************/

class Calculator {
  var value = 0.0
  
  func add(_ num: Double) {
    value += num
  }
  func subtract(_ num: Double) {
    value -= num
  }
  func multiply(_ num: Double) {
    value *= num
  }
  func divide(_ num: Double) {
    value /= num
  }
  func reset() {
    value = 0
  }
}

let calculator = Calculator() // 객체생성
calculator.value

calculator.add(10)
calculator.add(5)

calculator.subtract(9)
calculator.subtract(10)

calculator.multiply(4)
calculator.multiply(-10)

calculator.divide(10)

calculator.reset()

calculator.value




//: [Next](@next)

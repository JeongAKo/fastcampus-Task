//: [Previous](@previous)
/*:
 ---
 # Initializer 의 다른 특징들
 ---
 */

/***************************************************
 초기화 이전에 프로퍼티 사용 불가
 초기화 이전 단계에서 인스턴스 메서드 호출 불가
 - 다른 메서드 호출 중 초기화 되지 않은 프로퍼티를 사용할 수도 있기 때문에 컴파일 에러 발생
 ***************************************************/

class Chart {
  var height: Int
  var xPosition: Int
  
  init(height: Int, xPosition: Int) {
    self.height = height
//    print(self.height)    // 초기화 이후
//    print(self.xPosition) // 초기화 이전
    
//    self.printValues()     // 저장 프로퍼티 전체 초기화 이전
    self.xPosition = xPosition
//    self.printValues()     // 저장 프로퍼티 전체 초기화 이후
  }
  
  func printValues() {
    print(self.height)
    print(self.xPosition)
  }
}

let chart = Chart(height: 10, xPosition: 20)



/***************************************************
 Extension Initializer
 - Extension에서는 Convenience Initializer는 추가할 수 있어도
   Designated Initializer는 할 수 없음
 ***************************************************/

class Rectangle {
  var height: Int
  var xPosition: Int
  
  init(height: Int, xPosition: Int) {
    self.height = height
    self.xPosition = xPosition
  }
}

extension Rectangle {
  // Convenience Initializer 만 가능
//  init(xPosition: Int) {
//    self.height = 10
//    self.xPosition = xPosition
//  }
  
  convenience init(height: Int) {
    self.init(height: height, xPosition: 10)
  }
}

let rect1 = Rectangle(height: 10, xPosition: 20)
let rect2 = Rectangle(height: 10)




/***************************************************
 Required Initializer
 - 상속받은 클래스에서 반드시 작성해주어야 하는 초기화 메서드가 있을 때 required 키워드 사용
 - 이 경우 서브 클래스에서는 해당 초기화 메서드를 반드시 작성해주어야 하며, override 키워드 생략 가능
 ***************************************************/

class Animal {
  let name: String
  let age: Int

  init(age: Int) {
    self.age = age
    self.name = "Tori"
  }
  required init(name: String) {
    self.name = name
    age = 3
  }
}

class Dog: Animal {
  let type: String
  
  init(type: String) {
    self.type = type
    super.init(name: "Tori")
  }
  
  required init(name: String) {
    self.type = "Poodle"
    super.init(name: name)
  }
}

let dog1 = Dog(type: "Poodle")
let dog2 = Dog(name: "Tori")




/***************************************************
 Deinitializer
 - 할당된 객체가 해제될 때는 deinit 메소드가 호출됨.
 ***************************************************/

//deinit {
//  // 객체 메모리 해제 시 동작할 코드
//  print("Deinitialzed")
//}


class SomeClass {
  init() {
    print("Initialized")
  }
  deinit {
    print("Deinitialized")
  }
}

var someClass = SomeClass()
/*:
 ---
 ### Question
 - 어떻게 객체에 할당된 메모리를 해제시킬 수 있을까
 ---
 */



var someClass1: SomeClass? = SomeClass()   //
someClass1 = nil


func someFunction() {
  let someClass = SomeClass()
  someClass
}
someFunction()


//: [Next](@next)

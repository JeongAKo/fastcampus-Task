//: [Previous](@previous)
/*:
 # Class
 */
/***************************************************
 Value Type => struct, enum  (Stack 에 저장)
 Reference Type => class  (Heap 에 저장)
 ***************************************************/

/***************************************************
 class <#ClassName#>: <#SuperClassName#>, <#ProtocolName...#> {
   <#PropertyList#>
   <#MethodList#>
 }
 
 <#ClassName()#>  heap에 데이터 저장 // instance
 
 class - 정의
 instance - class 를 메모리에 생성한 것
 object - instance 를 담아두고 실제 사용하는 놈
 
 let <#instanceName#> = <#ClassName()#>
 instanceName.<#propertyName#>
 instanceName.<#methodName()#>
 ***************************************************/


class Dog {
  var color = "White"
  var eyeColor = "Black"
  var height = 30.0
  var weight = 6.0
  
  func sit() {
    print("sit")
  }
  func layDown() {
    print("layDown")
  }
  func shake() {
    print("shake")
  }
}


let bobby: Dog = Dog()
bobby.color
bobby.color = "Gray"
bobby.color
bobby.sit()

let tory = Dog()
tory.color = "Brown"
tory.layDown()


/*:
 ---
 ### Question
 - 자동차 클래스 정의 및 객체 생성하기
 ---
 */
/***************************************************
 자동차 클래스
 - 속성: 차종(model), 연식(model year), 색상(color) 등
 - 기능: 운전하기(drive), 후진하기(reverse) 등
 ***************************************************/


class Car1{
    var model = "A6"
    var modelYear = 2019
    var color = "black"
    
    func drive() {
        print ("운전합니다")
    }
    func reverse() {
        print ("후진합니다")
    }
}

let bobo: Car1 = Car1()
bobo.color = "Gray"
bobo.color
bobo.model = "B6"
bobo.model
bobo.modelYear = 2017
bobo.modelYear
bobo.drive()
bobo.reverse()

/*:
 ---
 ### Answer
 ---
 */
class Car {
  let model = "리어카"
  let modelYear = 2016
  let color = "Cream White"
  
  func drive() {
    print("전진")
  }
  func reverse() {
    print("후진")
  }
}

let mycar = Car()
mycar.model
mycar.modelYear
mycar.color
mycar.drive()
mycar.reverse()


//: [Next](@next)

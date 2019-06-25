//: [Previous](@previous)
/*:
 # Super Class Initializing
 */
/*:
 ![Initializer](Init.png)
 */

/***************************************************
 - 서브 클래스는 자기 자신 이외에 수퍼 클래스의 저장 프로퍼티까지 초기화 해야 함
 - 서브 클래스는 수퍼 클래스의 Designated Initializer 호출 필요 (Convenience 는 불가)
 - 수퍼 클래스의 Designated Initializer 가 기본 init 함수 하나만 있을 경우 자동으로 super.init() 이 호출됨
 ***************************************************/


print("\n---------- [ Super Class Init ] ----------\n")

class Base {
  var someProperty: String
  
  init() {
    someProperty = "someProperty"
  }
  
//  init(_ value: String) {
//    self.someProperty = "someProperty"
//  }
  
  convenience init(someProperty: String) {
    self.init()
    self.someProperty = someProperty
  }
}

class Rectangle: Base {
  var width: Int
  var height: Int
  
  override init() {
    width = 10
    height = 5
  }
  
  init(width: Int, height: Int) {
    self.width = width
    self.height = height
  }
}



/***************************************************
 Designated Initializer가 하나이면 서브 클래스에서 수퍼 클래스의 생성자를 부르지 않아도 자동 호출
 여러 개로 만들 경우 어떤 초기화 메서드를 선택해야 할지 알 수 없으므로 선택해주지 않으면 에러 발생
 이 때는, 서브 클래스의 모든 Designated Initializer 마다 수퍼 클래스의 초기화 함수를 명시적으로 선택해주어야 함.
 Convenience Initializer는 무관
 ***************************************************/




print("\n---------- [ Override Init ] ----------\n")

class Human {
  var name: String
  
  init() {
    self.name = "홍길동"
  }
  init(name: String) {
    self.name = name
  }
}


class Student: Human {
  var school: String
  
  override init() {
    self.school = "University"
    
    // 두 개의 지정 생성자 중 하나 호출
    super.init()
//    super.init(name: "이순신")
  }
  
  init(school: String) {
    self.school = school
    super.init()
  }
  
  // 수퍼 클래스의 지정 생성자를 오버라이드하여 편의 생성자로 사용 가능
  convenience override init(name: String) {
    self.init(school: "Univ")
    self.name = name
  }
}

let student1 = Student()
let student2 = Student(name: "철수")
let student3 = Student(school: "High School")


/*:
 ---
 ### Question
 - 자식 클래스를 먼저 초기화하고 부모 클래스 초기화 메서드를 나중에 호출해야 하는 이유는?
 ---
 */

print("\n---------- [ Self Init First ] ----------\n")

class Shape {
  var name: String
  var sides: Int
  
  init(sides: Int, named: String) {
    self.sides = sides
    self.name = named
    printShapeDescription()
  }
  
  func printShapeDescription() {
    print("Shape Name : \(self.name)")
    print("Sides : \(self.sides)")
  }
}


class Triangle: Shape {
  var hypotenuse: Int
  
  init(hypotenuse: Int) {
    self.hypotenuse = hypotenuse
    super.init(sides: 3, named: "Triangle")
  }
  
  override func printShapeDescription() {
    print("Hypotenuse : \(self.hypotenuse)")
  }
}

let triangle = Triangle(hypotenuse: 12)
let triangle1: Shape = Triangle(hypotenuse: 12)
let rectangle = Shape(sides: 4, named: "Rect")


/***************************************************
 자신의 프로퍼티를 초기화 하지 않은 상태로 부모 클래스의 초기화 메서드를 호출했을 경우
 초기화되지 않은 프로퍼티를 사용하게 되는 일이 발생 할 수 있음.
 
 위 코드에서는 부모클래스의 init 메서드에서 printShapeDescription() 을 호출하고 있지만
 실제 실행되는 메서드는 그것을 호출한 객체의 override 된 메서드가 실행되는 것을 확인 가능
 ***************************************************/


//: [Next](@next)

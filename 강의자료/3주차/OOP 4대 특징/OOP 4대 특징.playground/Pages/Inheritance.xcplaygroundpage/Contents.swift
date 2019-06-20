//: [Previous](@previous)
/*:
 ---
 # Inheritance
 ---
 */

class Cat {
  let leg = 4
  func cry() {
    print("miaow")
  }
}

class KoreanShortHair: Cat {}

let cat = Cat()
print(cat.leg)
cat.cry()

let koshort = KoreanShortHair()
print(koshort.leg)
koshort.cry()


/*:
 ---
 ### Question
 Person, Student, University Student 클래스 구현하고 관련 속성 및 메서드 구현
 - 상속을 하지 않고 각각 개별적으로 만들면 어떻게 구현해야 하는지 확인
 - 상속을 적용하면 어떻게 바뀌는지 확인
 ---
 */
class Person {
    var gender = "여"
    var name = "고정아"
    var age = "29"

    func eat() {
        print("간식을 냠냠")
    }
}

class Student:Person {}
    let person = Person()
    print(person.age)
    person.eat()


class UniversityStudent:Person {}
    let uniPerson = Person()
    print(uniPerson.gender)
    print(uniPerson.name)


class Humannn {
    var gender = "여"
    var age = "29"
    
    func eat2() {
        print("간식을 먹는다")
    }
    func play2() {
        print("피아노를 친다")
    }
}

class JeongA : Humannn {}
    let ja = Humannn()
    ja.age = "18"
    ja.gender = "남"
    ja.eat2()

print(ja.age)
print(ja.gender)
ja.eat2()

/*:
 ## final
 */
print("\n---------- [ Final ] ----------\n")

class Shape {
}

final class Circle: Shape {   // 더이상 상속을 안하고 싶을때 선언 *상속이 되지 않는다*
}                             // 컴퍼일러가 인식할 때 힌트 (조금이라도 더 빨라짐)

//class Oval: Circle {
//}

/*:
 ---
 ### Answer
 ---
 */

class Person1 {
  let name = "홍길동"
  let age = 20
  
  func eat() {
    print("eat")
  }
}


print("\n---------- [ Without Subclassing ] ----------\n")

class Student1 {
  let name = "홍길동"
  let age = 20
  let grade = "A"

  func eat() {
    print("eat")
  }
  func study() {
    print("study")
  }
}

class UniversityStudent1 {
  let name = "홍길동"
  let age = 20
  let grade = "A"
  let major = "Computer Science"

  func eat() {
    print("Eat")
  }
  func study() {
    print("Study")
  }
  func goMT() {
    print("Go membership training")
  }
}


print("\n---------- [ Subclassing ] ----------\n")

//class Student1: Person1 {
//  let grade = "A"
//
//  func study() {
//    print("study")
//  }
//}
//
//class UniversityStudent1: Student1 {
//
//  let major = "Computer Science"
//
//  func goMT() {
//    print("Go membership training")
//  }
//}

//: [Next](@next)

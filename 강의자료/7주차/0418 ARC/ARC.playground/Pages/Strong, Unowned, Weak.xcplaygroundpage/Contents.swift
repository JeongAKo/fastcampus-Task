//: [Previous](@previous)
//: - - -
//: # Unowned
//: - - -

class Teacher {
  var student: Student?
  deinit {
    print("Teacher is being deinitialized")
  }
}

class Student {
  // strong, unowned, weak
//  let teacher: Teacher
//  unowned let teacher: Teacher
  weak var teacher: Teacher?
  
  init(teacher: Teacher) {
    self.teacher = teacher
  }
  deinit {
    print("Student is being deinitialized")
  }
}

var teacher: Teacher? = Teacher()
var student: Student? = Student(teacher: teacher!)
teacher?.student = student

//teacher?.student = nil

print("\n---------- [ teacher release ] ----------\n")
teacher = nil

print("\n---------- [ student release ] ----------\n")
student = nil





/***************************************************
 1) strong  : 명시적으로 nil 대입 필요. teacher?.student = nil // 14열 활성화 할 경우 31열 처럼 명시적으로 써줘야 한다
 2) unowned : 자동으로 deinit. nil 처리 된 속성에 접근하면 런타임 에러 발생 //살짜쿵 빠르지만 주의가 필요
 3) weak    : 자동으로 deinit. nil 처리 된 속성에 접근하면 nil 반환 //옵셔널 쪼금 귀찮은데 안전 - 일반적으로는 weak 을 사용
 ***************************************************/


//: [Next](@next)

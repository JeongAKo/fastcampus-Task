//: [Previous](@previous)
/*:
 # ARC Basic
 */

class Person {
  let testCase: String
  init(testCase: String) {
    self.testCase = testCase
  }
  deinit {
    print("\(testCase) is being deinitialized")
  }
}


/*:
 ---
 ### case 1. Allocation & Release
 ---
 */
print("\n---------- [ Case 1 ] ----------\n")

var obj1: Person? = Person(testCase: "case1")  //(alloc init) rc = 1
obj1 = nil //re = 0


/*:
 ---
 ### case 2. 참조 카운트 증가
 ---
 */
print("\n---------- [ Case 2 ] ----------\n")

var obj2: Person? = Person(testCase: "case2")
//re =1
var countUp = obj2
//re =2

obj2 = nil
//rc =1
countUp = nil
//rc =0

/*:
 ---
 ### case 3. Collection 에 의한 참조 카운트
 ---
 */
print("\n---------- [ Case 3 ] ----------\n")

var obj3: Person? = Person(testCase: "case3")
//rc= 1
var array = [obj3, obj3]
// rc += 2
obj3 = nil
// rc -= 1

array.remove(at: 0)
//rc -=1
array.remove(at: 0)
//rc -=1


/*:
 ---
 ### case 4. 강한 참조, 약한 참조
 - strong : 기본값. 강한 참조. Reference Count 1 증가
 - unowned : 미소유 참조. Count 증가하지 않음. 참조 객체 해제 시에도 기존 포인터 주소 유지
 - weak : 약한 참조. Count 증가하지 않음. 참조하던 객체 해제 시 nil 값으로 변경
 ---
 */

print("\n---------- [ Case 4 ] ----------\n")

var strongObj4 = Person(testCase: "case4") //rc 1
print(strongObj4)

//weak var weakObj4 = Person(testCase: "case4") //rc 0
//print(weakObj4)

//unowned var unownedObj4 = Person(testCase: "case4")
//print(unownedObj4)  ex) 04383xca -> ? /뎅글린포인터



/***************************************************
 unowned. weak  -  let , var
 ***************************************************/

// 다음 4줄의 코드 중 사용 불가능한 것은?

//unowned let unownedLet = strongObj4 // 주의가 필요! 바뀌지 않는다는 확신이 있을때
//unowned var unownedVar = strongObj4
//weak let weakLet = strongObj4 // if rc count = 0 -> nil  변화가 일어나는데 nil 로 바껴야 하는데 let 이면 안댐
//weak var weakVar = strongObj4


// unowned 와 weak 의 타입은?
//print("Unowned type: ", type(of: unownedVar))
//print("Weak type: ", type(of: weakVar)) //옵셔널



//: [Next](@next)

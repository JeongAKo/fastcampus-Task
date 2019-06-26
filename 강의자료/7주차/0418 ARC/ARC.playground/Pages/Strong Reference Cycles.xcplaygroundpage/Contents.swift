//: [Previous](@previous)
/*:
 ---
 # Strong Reference Cycles
 ---
 */

class Person {
  var pet: Dog?
  func doSomething() {}
  deinit {
    print("Person is being deinitialized")
  }
}

class Dog {
  var owner: Person?
  func doSomething() {}
  deinit {
    print("Dog is being deinitialized")
  }
}



var giftbot: Person! = Person()
var tori: Dog! = Dog()

giftbot.pet = tori
tori.owner = giftbot

giftbot.doSomething()
tori.doSomething()


giftbot.pet = nil
tori.owner = nil //둘중 하나만 해지해줘도 된당


giftbot = nil
tori = nil

//strong Reference Cycle


/*:
 ---
 ### Question
 - 두 객체를 메모리에서 할당 해제하려면 어떻게 해야 할까요?
 ---
 */

/*:
 ---
 ### Answer
 ---
 */
// 순서 주의

giftbot.pet = nil
tori.owner = nil

giftbot = nil
tori = nil




//: [Next](@next)

//: [Previous](@previous)
/*:
 ---
 # Types
  ---
 */
/*:
 ---
 ## Tuple
 ---
 */

/***************************************************
 Tuple 유형의 접근 수준은 자동으로 추론되며 명시적으로 지정 불가능
 튜플 유형에 대한 엑세스 수준은 해당 튜플에 사용된 모든 유형 중 가장 제한적인 엑세스 수준에 맞춰지게 됨
 ***************************************************/

internal class SomeInternalClass {}
private class SomePrivateClass {}

fileprivate func returnTupleFunction() -> (SomeInternalClass, SomePrivateClass) {
  return (SomeInternalClass(), SomePrivateClass())
}

returnTupleFunction()

//let something = returnTupleFunction()
//명시적으로 let 앞에 private 이나 fileprivate 으로 적어줘야 한다
// private let something = returnTupleFunction()   --요런식으로
/*:
 ---
 ## Enumeration Types
 ---
 */

private enum 방위1 {
  case 동, 서, 남, 북
}


fileprivate let enumeration = 방위1.남
switch enumeration {
case .동, .서:
  print("좌우")
case .남, .북:
  print("상하")
}


// 다음과 같이 각 case 별로 '개별적인 접근 수준 설정 불가' 하고 eum 앞에다가 붙여주기 36열 참고
//enum 방위2 {
//  fileprivate case 동
//  fileprivate case 서
//  fileprivate case 남
//  fileprivate case 북
//}

/*:
 ---
 ## Type Aliases
 ---
 */

class AliasClass {
  let someProperty = 1
}

//public typealias Typealiases = AliasClass
internal typealias Typealiases = AliasClass
//fileprivate typealias Typealiases = AliasClass


let aliasesInstance = Typealiases()
aliasesInstance.someProperty




//: [Next](@next)

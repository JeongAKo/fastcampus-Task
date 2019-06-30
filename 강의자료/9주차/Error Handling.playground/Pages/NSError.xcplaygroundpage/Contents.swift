//: [Previous](@previous)
import Foundation
/*:
 ---
 # NSError
 ---
 */

func throwNSError() throws {
  // NSError() - 기본 생성자 (X),  Domain cannot be nil
  throw NSError(domain: "Domain error string", code: 99, userInfo: ["MyKey": "MyValue"])
}

func throwsNSErrorExample() {
  do {
    try throwNSError()
  } catch {
    print("Error :", error)
    
    let e = error as NSError  //error쓰고 쩜 찍으면 많이 안나옴 swift가 가지고 있는게 ojc보다 적기 때문에 // error를 타입캐스팅 해줘야 한다 (NS에러가 종류가 더 많아)
    
    print("NSError :", e)
    print("domain :", e.domain)
    print("code :", e.code)
    print("userInfo :", e.userInfo)
  }
}

throwsNSErrorExample()


//: [Next](@next)

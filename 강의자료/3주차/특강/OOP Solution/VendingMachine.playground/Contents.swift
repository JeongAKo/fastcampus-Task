import Foundation

class Beverage {
  let name: String
  var price: Int
  let manufacture: String
  
  init(name: String, price: Int, manufacture: String) {
    self.name = name
    self.price = price
    self.manufacture = manufacture
  }
}

class VendingMachine {
  
  var money: Int = 0
  
  func insert(_ money: Int) {
    self.money += money
    print("\(money)가 입금되었습니다.")
  }
  
  func change() {
    print("\(money)가 반환되었습니다.")
    money = 0
  }
  
  func check() {
    print("\(money)가 남아 있습니다.")
  }
  
  func purchase(name: String) {
    let beverage = Beverage(name: name, price: 1500, manufacture: "동아오츠카")
    guard beverage.price <= self.money else {
      print("잔돈이 부족합니다.")
      return
    }
    
    print("\(beverage.price)짜리 \(beverage.manufacture)에서 만든 \(beverage.name)음료가 나왔습니다.")
    self.money -= beverage.price
  }
}

let machine = VendingMachine()
machine.insert(2000)
machine.check()
machine.purchase(name: "포카리스웨트")
machine.change()

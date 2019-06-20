//: [Previous](@previous)
 /***************************************************
 celcius, fahrenheit, kelvin 온도 3가지 케이스를 가진 enum 타입 Temperature 를 정의
 각 케이스에는 Double 타입의 Associated Value 를 받도록 함
 
 Temperature 타입 내부에 각 온도를 섭씨 온도로 변환해주는 toCelcius() 함수를 구현
 섭씨 = (화씨 - 32) * 5 / 9
 섭씨 = 켈빈 + 273
 ***************************************************/
 
 enum Temperature {
 
 }




 /***************************************************
 다음 ArithmeticExpression 의 각 케이스별로 연산을 수행하고 그 값을 반환하는 evaluate 함수 구현
 ***************************************************/
indirect enum ArithmeticExpression {
  case number(Int)
  case addition(ArithmeticExpression, ArithmeticExpression)
  case multiplication(ArithmeticExpression, ArithmeticExpression)
}

let five = ArithmeticExpression.number(5)
let four = ArithmeticExpression.number(4)
let sum = ArithmeticExpression.addition(five, four)
let product = ArithmeticExpression.multiplication(sum, ArithmeticExpression.number(2))

func evaluate(_ expression: ArithmeticExpression) -> Int {
//  switch expression {
    // 이곳에 code 구현
//  }
  return 0
}


evaluate(five)    // 결과 : 5
evaluate(sum)     // 결과 : 9
evaluate(product) // 결과 : 18




//: [Next](@next)

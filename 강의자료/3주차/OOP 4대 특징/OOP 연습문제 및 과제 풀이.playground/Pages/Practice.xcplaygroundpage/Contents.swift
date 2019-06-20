//: [Previous](@previous)

/***************************************************
 1. width, height 속성을 가진 Quadrangle 클래스 정의
 2. 초기화 메서드에서 width, height 프로퍼티 값을 설정할 수 있도록 구현
 3. 사각형의 가로 세로 길이를 설정할 수 있는 메서드 구현
 4. 사각형 가로와 세로의 길이를 반환하는 메서드 구현
 5. 사각형 넓이를 반환하는 메서드 구현
 6. 다음과 같은 속성을 지닌 객체 생성
 - 직사각형 1개 속성: width = 10, height = 5
 - 정사각형 1개 속성: width = 7, height = 7
 ***************************************************/

class Quadrangle {
  var width: Int
  var height: Int
  
  init(width: Int, height: Int) {
    self.width = width
    self.height = height
  }

  func area() -> Int {
    return width * height
  }
  
  func dimension() -> (Int, Int) {
    return (width, height)
  }
  
  func setDimension(width: Int, height: Int) {
    self.width = width
    self.height = height
  }
}

let quadrangle = Quadrangle(width: 10, height: 5)
quadrangle.area()
quadrangle.dimension()

quadrangle.setDimension(width: 8, height: 8)
quadrangle.area()

let (width, height) = quadrangle.dimension()
width
height

let square = Quadrangle(width: 7, height: 7)
square.area()
square.dimension()





/***************************************************
 1. 채널 정보, Volume 값, 전원 설정여부를 속성으로 가지는 클래스 정의
 2. TV 의 현재 채널 및 볼륨을 확인할 수 있는 메서드 및 변경 가능한 메서드 구현
 3. TV 전원이 꺼져있을 때는 채널과 볼륨 변경을 할 수 없도록 구현
 4. TV 전원이 꺼져있을 때는 채널과 볼륨 정보를 확인했을 때 -1 이 반환되도록 구현
 ***************************************************/

class TV {
  var isPowerOn = false
  var channel = 9
  var volume = 10
  
  func operatePower(turnOn: Bool) {
    isPowerOn = turnOn
  }
  
  func currentChannel() -> Int {
    guard isPowerOn else {
      print("전원이 꺼져있습니다.")
      return -1
    }
    return channel
  }
  
  func currentVolume() -> Int {
    guard isPowerOn else {
      print("전원이 꺼져있습니다.")
      return -1
    }
    return volume
  }
  
  func setChannel(_ channel: Int) {
    guard isPowerOn else { print("전원이 꺼져있습니다."); return }
    self.channel = channel
  }
  
  func setVolume(_ volume: Int) {
    guard isPowerOn else { print("전원이 꺼져있습니다."); return }
    self.volume = volume
  }
}


let tv = TV()
tv.operatePower(turnOn: true)
tv.currentChannel()
tv.currentVolume()
tv.setChannel(99)
tv.channel

tv.operatePower(turnOn: false)
tv.currentChannel()
tv.setVolume(2)
tv.currentVolume()




/***************************************************
 1. 사각형의 길이를 설정하는 초기화 메서드, 둘레와 넓이값을 구하는 메서드 구현
 2. 원의 반지름을 설정하는 초기화 메서드, 둘레와 넓이값을 구하는 메서드 구현
 ***************************************************/

class Square {
  let length: Int
  
  init(length: Int) {
    self.length = length
  }
  func area() -> Int {
    return length * length
  }
  func perimeter() -> Int {
    return 4 * length
  }
}


class Circle {
  let radius: Double
  
  init(radius: Double) {
    self.radius = radius
  }
  func area() -> Double {
    return radius * radius * .pi
  }
  func circumference() -> Double {
    return 2 * radius * .pi
  }
}


//: [Next](@next)

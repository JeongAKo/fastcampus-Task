//: [Previous](@previous)

/***************************************************
 1. width, height 속성을 가진 Quadrangle 클래스 정의
 2. 초기화 메서드에서 width, height 프로퍼티 값을 설정할 수 있도록 구현
 3. 사각형의 가로 세로 길이를 설정할 수 있는 메서드 구현
 4. 사각형의 가로세로 길이  /  사각형의 넓이를 반환하는 메서드를 각각 구현
 5. 다음과 같은 속성을 지닌 인스턴스 생성
 
 - 직사각형 1개 속성: width = 10, height = 5
 - 정사각형 1개 속성: width = 7, height = 7
 ***************************************************/
//
//class Quadrangle {
//    let width: Double
//    let height: Double
//
//    init() {
//        width = 0.0
//        height = 0.0
//    }
//    init(width: Double, height: Double) {
//        self.width = width
//        self.height = height
//    }
//
//    func length(){
//        print(width)
//        print(height)
//    }
//    func area(){
//        let c = self.width * self.height
//        print(c)
//    }
//}
//let a = Quadrangle(width: 10, height: 5)
//let b = Quadrangle(width: 7, height: 7)
//
//a.length()
//a.area()
//b.length()
//b.area()
//
//
///***************************************************
// 1. 채널 정보, Volume 값, 전원 설정여부를 속성으로 가지는 클래스 정의
// 2. TV 의 현재 채널 및 볼륨을 확인할 수 있는 메서드 및 변경 가능한 메서드 구현
// 3. TV 전원이 꺼져있을 때는 채널과 볼륨 변경을 할 수 없도록 구현
// 4. TV 전원이 꺼져있을 때는 채널과 볼륨 정보를 확인했을 때 -1 이 반환되도록 구현
// ***************************************************/
//
class TV {
    var channel : Int = 0
    var volume : Int = 0
    var onoff : Bool = false

    func check() {
        if onoff {
            print("현재 채널은 \(self.channel)이고 볼륨은 \(volume)입니다." )
        } else {
            print("TV가 꺼져있습니다")
        }
    }

    func chageChannel(channel: Int) {
        if onoff {
            self.channel = channel
        } else {
            print("-1")
        }
    }
    
//    func ctr() {
//        if onoff {
//            if check() {
//                print ("-1")
//            } else if {
//
//            } else {
//                print ("TV가 꺼져있습니다")
//            }
//        } else {
//            return
//        }
//
//
//    }

}




/***************************************************
 1. 사각형의 길이를 설정하는 초기화 메서드, 둘레와 넓이값을 구하는 메서드 구현
 ***************************************************/

class Square {
    var width: Int
    var height: Int
    
    init(width :Int, height :Int) {
        self.width = width
        self.height = height
    }
    
    func change(width :Int, height :Int) {
        self.width = width
        self.height = height
    }
    
//    func cir() -> Int {
//        return (width * 2) + (height * 2)
//    }
    func cir() {
        print((width * 2) + (height * 2))
    }

    func area() {
        let arrea = width * height
        print (arrea)
        
    }
}

let square = Square(width: 10, height: 10)
square.cir()

let square2 = Square(width: 20, height: 10)
print(square2.cir())


/***************************************************
 2. 원의 반지름을 설정하는 초기화 메서드, 둘레와 넓이값을 구하는 메서드 구현
 ***************************************************/

class Circle {
    var hc:Double
    
    init(hc:Double) {
        self.hc = hc
    }
    func cir() {
        print( hc * 2.0 * 3.14 )
    }
    func area() {
        print( hc * hc * 3.14)
    }
    
}

let circle = Circle(hc: 10)
Circle.init(hc: 10)



//: [Next](@next)

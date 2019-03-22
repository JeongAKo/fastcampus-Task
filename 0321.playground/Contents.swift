import UIKit

//1. 첨부된 이미지를 보고 상속을 이용해 구현해보기

class Animal{
    var brain = true
    var legs = 0
}

class Human: Animal {
    
    override var legs: Int {
        get {
            return super.legs
        }
        set {
            super.legs = newValue
        }
    }
}

class Pet: Animal {
    var fleas = 0
    override var legs: Int {
        get {
            return super.legs
        }
        set {
            super.legs = newValue
        }
    }
}
class Dog: Pet {

    override var fleas: Int {
        get {
            return super.fleas
        }
        set {
            super.fleas = newValue
        }
    }
}

class Cat: Pet {
    
    override var fleas: Int {
        get {
            return super.fleas
        }
        set {
            super.fleas = newValue
        }
    }
}


let human = Human()
human.legs = 2
human.legs

let pet = Pet()
pet.legs = 4
pet.legs

let dog = Dog()
dog.fleas = 8
dog.fleas

let cat = Cat()
cat.fleas = 4
cat.fleas


// 1번 init 을 이용한 풀이

class Animal2 {
    var brain = true
    var legs :Int
    
    init(legs: Int) {
        self.legs = legs
    }
}

class Human2: Animal2 {
//    override init(legs: Int) {
//        super.init(legs: legs)
//    }
}

let human2 = Human2(legs: 2)
human2.legs

class Pet2: Animal2 {
    var fleas: Int
    
    init(fleas: Int, legs: Int) {
        self.fleas = fleas
        super.init(legs: legs)
    }
}

let pet2 = Pet2(fleas: 0, legs: 4)
pet2.brain
pet2.fleas
pet2.legs

class Dog2: Pet2 {
    

}

class Cat2: Pet2 {
    
    
}

let dog2 = Dog2(fleas: 8, legs: 4)
dog2.brain
dog2.fleas
dog2.legs

let cat2 = Cat2(fleas: 4, legs: 4)
cat2.brain
cat2.fleas
cat2.legs

// 2번 문제

class Square {
    var side : Int
    
    init(side:Int) {
        self.side = side
    }
    func area() {
        print ("사각형의 넓이는 \(side * side)")
    }
    func circle() {
         print ("사각형의 둘레는 \(side * 4)")
    }
}
let square = Square(side: 2)
square.area()
square.circle()

class Cube {
    var side : Int
    
    init(side:Int){
        self.side = side
    }
    func volume() {
        print ("큐브의 부피는 \(side * side * side)입니다.")
    }
}

let cube = Cube(side: 2)
cube.volume()

class Rectangle {
    var width : Int
    var lengnth : Int
    var height : Int

    init(width:Int, lengnth:Int, height: Int){
        self.width = width
        self.lengnth = lengnth
        self.height = height
    }
    func area() {
        print ("직사각형의 넓이는 \(width * lengnth)입니다")
    }
    func volume() {
        print ("직사각형의 둘레는 \((2 * width) * (2 * lengnth))입니다")
    }
    func rectsol() {
        print ("직사각형의 부피는 \(width * lengnth * height)입니다")
    }
}

let rectangle = Rectangle(width: 2, lengnth: 2, height: 2)
rectangle.area()
rectangle.volume()
rectangle.rectsol()

class Circle {
    var r : Double
    var pie : Double = 3.14
    var height : Double
    
    init(r:Double, height:Double) {
        self.r = r
        self.height = height
    }
    
    func area() {
        print ("원의 넓이는 \(r * r * pie)입니다")
    }
    func cir() {
        print ("원의 둘레는 \(2 * pie * r)입니다")
    }
    func cirCy() {
        print ("원통의 부피는 \(pie * r * r * height)입니다")
    }
    func sphere() {
        print("구의 부피는 \(4/3 * pie * r * r * r)입니다")
    }
}
var circle = Circle(r: 2, height: 2)
circle.area()
circle.cir()
circle.cirCy()
circle.sphere()

class Triangle {
    var bottom : Double
    var height : Double
    init(bottom:Double, height:Double){
        self.bottom = bottom
        self.height = height
    }
    func area(){
        print("삼각형의 넓이는 \(0.5 * height * bottom) 입니다")
    }
}

var triangle = Triangle(bottom: 3.0, height: 3.0)
triangle.area()


class Trapezoid{
    var a : Double
    var b : Double
    var h : Double
    
    init(a:Double, b:Double, h:Double) {
        self.a = a
        self.b = b
        self.h = h
    }
    func area(){
        print("사다리꼴의 넓이는 \(0.5 * h * (a + b))입니다")
    }
}
var trapezoid = Trapezoid(a: 2.0, b: 2.0, h: 1.5)
trapezoid.area()

class Cone {
    var pie : Double = 3.14
    var h : Double
    var r : Double
    init(h:Double, r:Double){
        self.h = h
        self.r = r
    }
    
    func volume(){
        print("원통의 부피는 \(1/3 * pie * r * r * h)입니다")
    }
}

var cone = Cone(h: 3.0, r: 1.0)
cone.volume()


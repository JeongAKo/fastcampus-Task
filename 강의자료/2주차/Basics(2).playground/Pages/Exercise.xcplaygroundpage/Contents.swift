//: [Previous](@previous)
/*:
 # Exercise
 */


/*:
 ---
 ## Conditional Statements
 - 학점을 입력받아 각각의 등급을 반환해주는 함수 (4.5 = A+,  4.0 = A, 3.5 = B+ ...)
 - 특정 달을 숫자로 입력 받아서 문자열로 반환하는 함수 (1 = "Jan" , 2 = "Feb")
 - 세 수를 입력받아 세 수의 곱이 양수이면 true, 그렇지 않으면 false 를 반환하는 함수 (switch where clause 를 이용해 풀어볼 수 있으면 해보기)
 - 정수를 입력받아 윤년인지 아닌지 판단하는 함수 (2월 29일이 있는 해.  매 4년 마다 윤년. 매 100년 째에는 윤년이 아님. 매 400년 째에는 윤년)
 ---
 */
/*:
 ---
 ## Loops
 반복문(for , while , repeat - while)을 이용해 아래 문제들을 구현해보세요.
 - 자연수 하나를 입력받아 그 수의 Factorial 을 구하는 함수 (팩토리얼 :  5! = 5 x 4 x 3 x 2 x 1)
 - 자연수 두 개를 입력받아 첫 번째 수를 두 번째 수만큼 제곱하여 반환하는 함수 (2, 5 를 입력한 경우 결과는 2의 5제곱)
 - 자연수 하나를 입력받아 각 자리수 숫자들의 합을 반환해주는 함수 (1234 인 경우 각 자리 숫자를 합치면 10)
 ---
 */
/*:
 ---
 ## Control Transfer
 - 자연수 하나를 입력받아 1부터 해당 숫자 사이의 모든 숫자의 합을 구해 반환하는 함수를 만들되,
   그 합이 2000 을 넘는 순간 더하기를 멈추고 바로 반환하는 함수
 - 1 ~ 50 사이의 숫자 중에서 20 ~ 30 사이의 숫자만 제외하고 그 나머지를 모두 더해 출력하는 함수
 ---
 */
/*

Conditional Statements

1. 학점을 입력받아 각각의 등급을 반환해주는 함수 (4.5 = A+,  4.0 = A, 3.5 = B+ ...)
 */
func grade(point:Double){
  

    switch point {

case ...2.0:
    print("C")
case ...2.5:
    print("C+")
case ...3.0:
    print("B")
case ...3.5:
    print("B+")
case ...4.0:
    print("A")
case ...4.5:
    print("A+")
default:
    print("F")

    }
}
grade(point: 3.2)




//2. 특정 달을 숫자로 입력 받아서 문자열로 반환하는 함수 (1 = "Jan" , 2 = "Feb")

func call (month:Int) {

switch month {
    
case 1 :
    print ("Jan")
case 2 :
    print ("Fav")
case 3 :
    print ("Mar")
case 4 :
    print ("Aprl")
case 5 :
    print ("May")
case 6 :
    print ("Jun")
case 7 :
    print ("Jul")
case 8 :
    print ("Aug")
case 9 :
    print ("Stp")
case 10 :
    print ("Oct")
case 11 :
    print ("Nov")
default:
     print ("Dec")
    }
}

call(month: 12)


//3. 세 수를 입력받아 세 수의 곱이 양수이면 true, 그렇지 않으면 false 를 반환하는 함수 (switch where clause 를 이용해 풀어볼 수 있으면 해보기)


func call (num1:Int, num2:Int, num3:Int) ->Bool {
    
    let multiple = num1 * num2 * num3
    switch multiple {
    case let A where A > 0:
        return true
    default:
        return false
    }
}

print (call(num1: 2, num2: 4, num3: 5))


//4. 정수를 입력받아 윤년인지 아닌지 판단하는 함수 (2월 29일이 있는 해.  매 4년 마다 윤년. 매 100년 째에는 윤년이 아님. 매 400년 째에는 윤년)

func year(a:Int) {
    if (a % 4 == 0 && a % 100 == 0 || a % 400 == 0 ){
        print ("윤년 입니다")}
    else{
        print ("윤년이 아닙니다")}
}
year(a: 3400)


//Loops
//반복문(for , while , repeat - while)을 이용해 아래 문제들을 구현해보세요.

// 1. 자연수 하나를 입력받아 그 수의 Factorial 을 구하는 함수 (팩토리얼 :  5! = 5 x 4 x 3 x 2 x 1)

// for 문
func factorial(_ Num: Int) {
    var i = 1
    for foo in (1...Num).reversed() {
        i = i * foo
    }
     print(i)
}
factorial(5)


//while 문

func fac(_ number: Int) {
    var i = 1
    var total = 1
    while i <= number {
   
        total *= i
        i += 1
    
    }
        print(total)
}
    fac(4)





// 2. 자연수 두 개를 입력받아 첫 번째 수를 두 번째 수만큼 제곱하여 반환하는 함수 (2, 5 를 입력한 경우 결과는 2의 5제곱)

func J (numM: Int, numS: Int) -> Int {
    var z = 1
    for _ in 1...numS {
     z *= numM
    }
    return z
}
print(J(numM: 2, numS: 3))


// 3. 자연수 하나를 입력받아 각 자리수 숫자들의 합을 반환해주는 함수 (1234 인 경우 각 자리 숫자를 합치면 10)



//Control Transfer

// 1. 자연수 하나를 입력받아 1부터 해당 숫자 사이의 모든 숫자의 합을 구해 반환하는 함수를 만들되, 그 합이 2000 을 넘는 순간 더하기를 멈추고 바로 반환하는 함수

func plus(a:Int) -> Int{
    var b = 1
   
    for i in 1...a {
       b = b + i
        
        if b > 2000 {
          b =  b - i
            break
            
        }
    }
    return b
}

plus(a: 100)


// 2. 1 ~ 50 사이의 숫자 중에서 20 ~ 30 사이의 숫자만 제외하고 그 나머지를 모두 더해 출력하는 함수

func plusp(a: Int) -> Int{
    
    var sum = 0
    for i in 1...a {
     
        if  i >= 20 , i <= 30 {
            continue
        }
        sum += i
    }
    return sum

}
plusp(a: 50)



//: [Next](@next)

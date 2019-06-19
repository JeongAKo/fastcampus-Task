//: [Previous](@previous)

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

import Foundation


// 1번 - 학점을 입력받아 각각의 등급을 반환해주는 함수 (4.5 = A+,  4.0 = A, 3.5 = B+ ...)

var grade = 4.0

switch grade {
case 3.0 :
    print("학점은 B 입니다.")
case 3.5:
    print("학점은 B+ 입니다.")
case 4.0:
    print("학점은 A 입니다.")
case 4.5:
    print("학점은 A+ 입니다.")
default:
    print("...")
}


// 2번 - 세 수를 입력받아 세 수의 곱이 양수이면 true, 그렇지 않으면 false 를 반환하는 함수 (switch where clause 를 이용해 풀어볼 수 있으면 해보기)

func getThreeNum (num1: Int, num2: Int, num3: Int) -> Bool {
    
    var multiple = num1 * num2 * num3
    switch multiple {
    case multiple where multiple > 0 :
        return true
    default:
        return false
    }
}
getThreeNum(num1: 2, num2: 3, num3: 6)

// 3번 - 정수를 입력받아 윤년인지 아닌지 판단하는 함수 (2월 29일이 있는 해.  매 4년 마다 윤년. 매 100년 째에는 윤년이 아님. 매 400년 째에는 윤년)

func yoonYear(year: Int) {
    if (year % 400 == 0) && (year % 4 == 0) || (year % 100 == 0) {
        print("\(year)는 윤년입니다.")
    }else {
        print("\(year)는 윤년이 아닙니다.")
    }
}

yoonYear(year: 3400)


// 1 - 자연수 하나를 입력받아 그 수의 Factorial 을 구하는 함수 (팩토리얼 :  5! = 5 x 4 x 3 x 2 x 1)

func makeFactorial(num: Int) {
    var sumNum = 1
    for i in 1...num {
        sumNum *= i
    }
    print(sumNum)
}
makeFactorial(num: 5)


// 2 - 자연수 두 개를 입력받아 첫 번째 수를 두 번째 수만큼 제곱하여 반환하는 함수 (2, 5 를 입력한 경우 결과는 2의 5제곱)

func makeSquare(num1: Int, num2: Int) {
    var result = num1
    for _ in 1..<num2 {
        result *= num1
    }
    print(result)
}
makeSquare(num1: 2, num2: 5)







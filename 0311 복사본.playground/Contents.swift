import UIKit

/*
 
 fun 함수이름(파라미터 목록)->리턴형{
 실행할 코드
 }
 
 */


//[ 과제 ]
// 제출 : 수요일 밤까지 과제 제출용 폴더에 Playground 파일 업로드
// 정답 풀이는 목요일 전달


// [풀이] 1. 이름과 나이를 입력 받아 자신을 소개하는 글을 출력하는 함수

func say(name: String, age: Int) -> () {
    print( "저는 \(name) 입니다.","나이는 \(age) 살 입니다.")
}
say(name: "고정아", age: 1)

// [풀이] 2. 정수를 하나 입력받아 2의 배수 여부를 반환하는 함수


func check(number:Int) -> String {
    if number % 2 == 1 {
        return "홀수입니다"
    } else {
        return "짝수입니다"
    }
}
print(check(number: 3))


//let number = 7
//func evenNumber(number:Int) -> String {
//    if (number % 2 == 1) {
//        return "홀수입니다"
//
//    }else {
//        return "짝수입니다"
//
//    }
//}
//evenNumber(number: 7)


// [풀이] 3. 정수를 두 개 입력 받아 곱한 결과를 반환하는 함수 (파라미터 하나의 기본 값은 10)

func multiple(num1:Int = 10, num2:Int) -> Int {
    
    return num1 * num2
}

multiple(num2: 20)



//func plusplus(number1:Int, number2:Int) -> Int {
//
//    return  number1 * number2
//
//}
//
//plusplus(number1: 2, number2: 3)


// [풀이] 4. 4과목의 시험 점수를 입력받아 평균 점수를 반환하는 함수

func avg(subj:Double ...) -> Double{
    
    var total = 0.0
    for num in subj {
        total += num
    }
    
    return total / Double(subj.count)
}
avg(subj: 80, 90, 70, 80)


//func avg(_ subj:Double...) -> Double{
//    var total = 0.0
//    for number in subj {
//        total += number
//
//    }
//    return total / Double(subj.count)
//
//}
//
// print ("평균점수는 \(avg(80, 90, 84, 77)) 입니다")


// [풀이] 5. 점수(문자 또는 숫자)를 입력받아 학점을 반환하는 함수 만들기 (90점 이상 A, 80점 이상 B, 70점 이상 C, 그 이하 F)

func grade(point:Int) -> String {
    if point >= 90 {
        return "A"
    } else if point >= 80 {
        return "B"
    }else if point >= 70 {
        return "c"
    }else {
        return "F"
    }
}

grade(point: 77)

// func grade(point:Int) -> String {
//    if point >= 90{
//       return "A"
//    }
//    else if point >= 80{
//        return "B"
//    }
//    else if point >= 70{
//        return "C"
//    }
//    else{
//       return "F"
//    }
//}
//print(grade(point: 77))


// [풀이] 6. 점수(문자 또는 숫자)를 여러 개 입력받아 평균 점수에 대한 학점을 반환하는 함수 만들기 (90점 이상 A, 80점 이상 B, 70점 이상 C, 그 이하 F)

func grade1(point:Int...) -> String {
    
    var total = 0
    for num in point {
        total += num
    }
    
    let avg = total / (point.count)
    
    if avg >= 90 {
        return "A"
    } else if avg >= 80 {
        return "B"
    } else if avg >= 70 {
        return "C"
    } else {
        return "D"
    }
    
}
grade1 (point: 60, 70, 80, 90)




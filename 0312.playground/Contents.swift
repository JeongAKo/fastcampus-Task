import UIKit

//[ 과제 ]
// 1. 두 개의 자연수를 입력받아 두 수를 하나의 숫자로 이어서 합친 결과를 문자열로 반환하는 함수
//    (1과 5 입력 시 15,  29와 30 입력 시 2930,  6과 100 입력 시 6100)

func twoNum(a:Int, b:Int) -> (String){
    
    return "\(a)\(b)"

}
print(twoNum(a: 1, b: 5))


// 2. 문자열 두 개를 입력받아 두 문자열이 같은지 여부를 판단해주는 함수

func sameNum(a:String, b:String) -> Bool{
    
 return a == b

}

sameNum(a: "Hello", b: "bye")
sameNum(a: "Hello", b: "Hello")

// 3. 자연수를 입력받아 그 수의 약수를 모두 출력하는 함수

func mSu(a:Int) {
    for i in 1...a {
        if a % i == 0 {
            print(i, terminator: " ")
        }
    }
    
}

mSu(a: 10)


// 4. 2 이상의 자연수를 입력받아, 소수인지 아닌지를 판별하는 함수

func overTwo(a:Int) -> Bool{
    
    guard a > 1 else { return false }
    guard a != 2 else { return true }
    
    for i in 2..<a {
        if a % i == 0{
            return false
        }
    }
    return true
}

overTwo(a: 13)
overTwo(a: 2)
overTwo(a: 15)
overTwo(a: 33)



// 5. 자연수 하나를 입력받아 피보나치 수열 중에서 입력받은 수에 해당하는 자리의 숫자를 반환하는 함수
//참고로 피보나치 수열은 이전 두 수의 합이 다음 수가 되는 수열
//(입력된 숫자가 4면 0, 1, 1, 2, 3, 5 ... 에서 4번째 위치인 2 출력.    )







// 6. 100 이하의 자연수 중 3과 5의 공배수를 모두 출력하는 함수

func gong(){
    for i in 1...100 {
        if i % 3 == 0, i % 5 == 0 {
            print (i)
        }
    }
}

// 제출 : 수요일 밤까지 과제 제출용 폴더에 Playground 파일 업로드
// 정답 풀이는 목요일 전달
// 항목별 체감 난이도도 주석으로 같이 적어주세요.



    
    





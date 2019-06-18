//: [Previous](@previous)
/*:
 ---
 # Constants and Variables
 상수와 변수는 현재 어떤 데이터에 대한 상태값, 속성 정보 등을 담고 있는 컨테이너
 * 상수 (Constants) : 한 번 설정되면 값 변경 불가
 * 변수 (Variables) : 설정한 값을 변경 가능
 ---
 */

let maximumNumberOfLoginAttempts = 10
// maximumNumberOfLoginAttempts = 20

// currentLoginAttempt = 1
var currentLoginAttempt = 0
currentLoginAttempt = 1


/***************************************************
 1. 네이밍 확인 (의미, 방식, 길이 등)
 2. 네이밍 컨벤션
 3. 선언 순서
 ***************************************************/

/*:
 ---
 ## Declare multiple constants or variables
 ---
 */
var x = 0.0, y = 0.0, z = 0.0
x = 1
y = 2
z = 3

/*:
 ---
 ## Naming
 * 영어 외에도 유니코드 문자를 포함한 대부분의 문자를 사용해 네이밍 가능
 ---
 */
let π = 3.14159
let 你好 = "你好世界"
let 🐶🐮 = "dogcow"
let 한글 = "세종대왕"
let `let` = 1   // Swift 에서 사용되는 키워드일 경우 backquote(`) 를 이용해 사용 가능

print(π)
print(你好)
print(한글)
print(🐶🐮)
print(`let`)


/***************************************************
 변수로 사용할 수 없는 이름
 1. 같은 스코프 {} 범위 내에서 중복되는 이름
 2. 공백문자
 3. 수학 기호 (√, ∑ 등)
 4. 화살표 (→, ← 등)
 5. 숫자로 시작하는 이름 (시작 부분 외에는 사용 가능)
 ***************************************************/

// e.g.
// let 한글 = "ㄱ" 
// let 공 백 = "X"
// let √ = "root"
// let → = "arrow"
// let 369게임 = "12짝45짝..." 숫자를 맨 앞으로 쓸 수 없다



//: [Next](@next)

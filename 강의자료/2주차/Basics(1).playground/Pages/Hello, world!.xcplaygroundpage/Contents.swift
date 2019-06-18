//: [Previous](@previous)
/*:
 # Hello, world!
 */

// 로그 출력을 위한 함수 (Free Function)
print(3.3)

var num = 3

print(num)

print("숫자", num)

print("숫자 \(num)")

print("숫자 " + String(num))




/*:
 ## Comment
 [Quick Help Markup](https://goo.gl/YTge3C)
 */
/***************************************************
 주석 (Comment)
 - //  : 한 줄 주석
 - /// : 한 줄 주석 + Quick Help Markup
 - /* */ : 멀티 라인 주석  (Nested 가능)
 
 1. 빠르게 특정 부분의 코드를 비활성화
 2. 협업 또는 인계 시 이해를 돕기 위해
 3. 자기 자신을 위해
 4. 문서화
 
 - 주석 없이도 쉽게 이해할 수 있을 만한 코드를 짜는 것이 베스트이자 선행 과제
 ***************************************************/

//def

print("Hello, world!")
//print("Hello, world!")
/// print("Hello, world!")

/*
 print("Hello, world!")
 print("Hello, world!")
 */

/* This is also a comment
 but is written over multiple lines. */

/*
 This is the start of the first multiline comment.
 /* This is the second, nested multiline comment. */
 This is the end of the first multiline comment.
 */

print(1); print(2); print(3);


print(1)
print(2)
print(3)

/*:
 ## Semicolon (;)
 - 각 라인의 마지막에 붙는 세미콜론은 옵션
 - 한 라인에 여러 구문(다중 명령)을 사용하고 싶을 경우는 세미콜론 필수
 */
print(1); print(2); print(3);
//print(1);
//print(2);
//print(3);


//: [Next](@next)

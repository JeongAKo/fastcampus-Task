//: [Previous](@previous)
import Foundation


/***************************************************
 [ 실습1 ]
 다음 주소를 통해 얻은 json 데이터(국제정거장 위치 정보)를 파싱하여 출력하기
 "http://api.open-notify.org/iss-now.json"
 ***************************************************/

func practice1() {
    
    let astronauts = "http://api.open-notify.org/iss-now.json"
    let apiURL = URL(string: astronauts)!
    
    let dataTask = URLSession.shared.dataTask(with: apiURL) { (data, response, error) in
        guard error == nil else {return print("error: \(error)")}
        guard let response = response as? HTTPURLResponse,
        200..<400 ~= response.statusCode
            else {return print("Status Code is not vaild")}
        guard let data = data,
        let jsonObject =  try? JSONSerialization.jsonObject(with: data) as?
        [String:Any]
            else {return print("No data")}
        print("jsonObject :", jsonObject)
        
        guard (jsonObject["message"] as? String) == "success",
        let issPosition = jsonObject["iss_position"] as? [String:String]
        else { return print("Parsing Error") }
        
//      print( issPosition["longitude"])
//      print (issPosition["latitude"])
        
        issPosition.compactMap{$0.value}.forEach{print("국제정거장의 위치는: ",$0)}
    }
    dataTask.resume()  //해줘야지 실행된당
}
//practice1()


/***************************************************
 [ 실습2 ]
 User 구조체 타입을 선언하고
 다음 Json 형식의 문자열을 User 타입으로 바꾸어 출력하기
 
 e.g.
 User(id: 1, firstName: "Robert", lastName: "Schwartz", email: "rob23@gmail.com")
 User(id: 2, firstName: "Lucy", lastName: "Ballmer", email: "lucyb56@gmail.com")
 User(id: 3, firstName: "Anna", lastName: "Smith", email: "annasmith23@gmail.com")
 ***************************************************/

let jsonString2 = """
{
"users": [
{
"id": 1,
"first_name": "Robert",
"last_name": "Schwartz",
"email": "rob23@gmail.com"
},
{
"id": 2,
"first_name": "Lucy",
"last_name": "Ballmer",
"email": "lucyb56@gmail.com"
},
{
"id": 3,
"first_name": "Anna",
"last_name": "Smith",
"email": "annasmith23@gmail.com"
},
]
}
"""

struct User {
    let id: Int
    let firsrName: String
    let lastName: String
    let email: String
}

func practice2() {
    let jsonData = jsonString2.data(using: .utf8)!
    
    do {
        let foundationObject = try JSONSerialization.jsonObject(with: jsonData)
        if let jsonDict = foundationObject as? [String: Any] {
            
            guard let filterData = jsonDict["users"] as? [[String: Any]] else {return print("fail")}
            
//            filterData.forEach{
//                  print("User(id: \($0["id"]), firstName: \($0["first_name"]), lastName: \($0["last_name"]), email: \($0["email"])")
//            }
            
            let final = filterData.map {
                
                User.init(id: $0["id"] as! Int, firsrName: $0["first_name"] as! String, lastName: $0["last_name"] as! String, email: $0["email"] as! String)
            }

            for i in final {

                print("유창근 짱잘해 good teacher",i)
            }
        }
    } catch {
        print(error.localizedDescription)
    }
}
practice2()



/***************************************************
 [ 실습3 ]
 Post 구조체 타입을 선언하고
 다음 주소를 통해 얻은 JSON 데이터를 파싱하여 Post 타입으로 변환한 후 전체 개수 출력하기
 "https://jsonplaceholder.typicode.com/posts"
 ***************************************************/

struct Post {
  let userId: Int
  let id: Int
  let title: String
  let body: String
}

func practice3() {
    
    let astronauts = "https://jsonplaceholder.typicode.com/posts"
    let apiURL = URL(string: astronauts)!
    
    let dataTask = URLSession.shared.dataTask(with: apiURL) { (data, response, error) in
        guard error == nil else {return print(error!)}
        guard let response = response as? HTTPURLResponse,
        200..<400 ~= response.statusCode
            else { return print("Status not vaild")}
        guard let date = data,
            let jsonObject = try? JSONSerialization.jsonObject(with: data!) as?
        [[String: Any]]
            else { return print("No data")}
//        print("jsonObject:", jsonObject)

        guard let filterData = jsonObject[0] as? [String: Any] else {return print("fail")}
//
        print("필터데이터 부분이다아아아아~~~~~~~~",filterData)

//        let final = filterData.map{
//            Post(userId: $0["userId"] as! Int, id: $0["id"] as! Int, title: $0["title"] as! String, body: $0["body"] as! String )
//        }
//
//        for i in final {
//            print(i)
//        }
    }
    dataTask.resume()
}

practice3()




//: [Table of Contents](Contents) | [Previous](@previous) | [Next](@next)



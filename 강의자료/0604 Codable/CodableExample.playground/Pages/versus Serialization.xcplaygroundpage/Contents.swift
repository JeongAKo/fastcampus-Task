//: [Previous](@previous)
//: # Versus Serialization
import Foundation

struct Dog: Codable {
  let name: String
  let age: Int
}

/*:
 ---
 ### Question
 - JSONSerialization을 이용해 Dog객체 생성
 - JSONDecoder를 이용해 Dog객체 생성
 ---
 */

/***************************************************
 Basic
 ***************************************************/
print("\n---------- [ Basic ] ----------\n")
let jsonData = """
  {
    "name": "Tory",
    "age": 3,
  }
  """.data(using: .utf8)!

// JSONSerialization

func practice() {
    let pracJsonData = jsonData
    
    do {
        if let jsonObject = try JSONSerialization.jsonObject(with: pracJsonData) as? [String: Any]{
            if let name = jsonObject["name"] as? String,
            let age = jsonObject["age"] as? Int {
                let dog = Dog(name: name, age: age)
                print(dog)
            }
        }
    } catch {
        print(error.localizedDescription)
    }
}

//practice()


// JSONDecoder

let jsonDecoder = JSONDecoder()
if let decodedDog = try? jsonDecoder.decode(Dog.self, from: jsonData) {
    print(decodedDog)
} else {
    print("fail")
}



/***************************************************
 Array
 ***************************************************/
print("\n---------- [ Array ] ----------\n")
let jsonArrData = """
  [
    { "name": "Tory", "age": 3 },
    { "name": "Tory", "age": 3 },
  ]
  """.data(using: .utf8)!

// JSONSerialization

if let jsonObjects1 = try? JSONSerialization.jsonObject(with: jsonArrData) as? [[String: Any]] {
    
    let testArray = jsonObjects1.map{
        
       if let age =  $0["age"] as? Int,
        let name = $0["name"] as? String{
        let dog = Dog(name: name, age: age)
        
        print(dog)
        
        }
    }
}

// JSONDecoder

let jsonEncoder = JSONEncoder()
if let decodedDog = try? jsonDecoder.decode([Dog].self, from: jsonArrData) {
    print(decodedDog)
}


/***************************************************
 Dictionary
 ***************************************************/
print("\n---------- [ Dictionary ] ----------\n")
let jsonDictData = """
{
  "data": [
    { "name": "Tory", "age": 3 },
    { "name": "Tory", "age": 3 },
  ]
}
""".data(using: .utf8)!

// JSONSerialization

if let foundationObject = try JSONSerialization.jsonObject(with: jsonDictData) as? [String:[[String:Any]]] {
    let final = foundationObject["data"].map{ $0.map{ Dog(name: $0["name"] as! String, age: $0["age"] as! Int)}}
    print(final!.compactMap{$0})
} else {
    print("fail")
}

// JSONDecoder

if let decodedDict = try? jsonDecoder.decode([String: [Dog]].self, from: jsonDictData) {
    if let dogArray = decodedDict["data"] {
        dogArray.forEach{ print($0)}
        
    } else {
        print("fail")
    }
}



/*:
 ---
 ### Answer
 ---
 */
print("\n---------- [ Answer ] ----------\n")

extension Dog {
  init?(from json: [String: Any]) {
    guard let name = json["name"] as? String,
      let age = json["age"] as? Int
      else { return nil }
    self.name = name
    self.age = age
  }
}

/***************************************************
 Basic
 ***************************************************/
print("---------- [ Basic ] ----------")
// JSONSerialization
if let jsonObject = try? JSONSerialization.jsonObject(with: jsonData) as? [String: Any] {
  if let dog = Dog(from: jsonObject) {
    print("Serialization :", dog)
  }
}

// JSONDecoder
if let dog = try? JSONDecoder().decode(Dog.self, from: jsonData) {
  print("Decoder :", dog)
}

/***************************************************
 Array
 ***************************************************/
print("\n---------- [ Array ] ----------")
// JSONSerialization
if let jsonObjects = try? JSONSerialization.jsonObject(with: jsonArrData) as? [[String: Any]] {
  
  jsonObjects
    .compactMap { Dog(from: $0) }
    .forEach { print("Serialization :", $0) }
}

// JSONDecoder
if let dogs = try? JSONDecoder().decode([Dog].self, from: jsonArrData) {
  dogs.forEach { print("Decoder :", $0) }
}


/***************************************************
 Dictionary
 ***************************************************/
print("\n---------- [ Dictionary ] ----------")
// JSONSerialization
if let jsonObject = try? JSONSerialization.jsonObject(with: jsonDictData) as? [String: Any],
  let data = jsonObject["data"] as? [[String: Any]] {

  data
    .compactMap { Dog(from: $0) }
    .forEach { print("Serialization :", $0) }
}

// JSONDecoder
//if let dogs = try? JSONDecoder().decode([String: [Dog]].self, from: jsonDictData) {
//  dogs.values.forEach { $0.forEach { print("Decoder :", $0) } }
//}



//: [Table of Contents](@Contents) | [Previous](@previous) | [Next](@next)

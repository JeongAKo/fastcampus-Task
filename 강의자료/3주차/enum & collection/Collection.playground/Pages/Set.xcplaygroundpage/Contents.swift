//: [Previous](@previous)
import Foundation
/*:
 ## Set
 - Unordered Collection
 - Unique Value
 - Set Literal = Array Literal
 */

//let fruitsArr = ["Apple", "Orange", "Melon"]
//let numbersArr = [1, 2, 3, 3, 3]
//let emptyArr = [String]()


let fruitsSet: Set<String> = ["Apple", "Orange", "Melon"]
let numbers: Set = [1, 2, 3, 3, 3]
let emptySet = Set<String>()

// array랑 똑같이 생겨서 헷갈리기 때문에 set 을 꼭 명시해줘야한다.
// 순서가 없고 중복되면 안된다.


//var number: Set = [1,2,3]
//number.insert(1) //순서가 없기 때문에 어펜드가 아닌 인서트로 한다.
//number

/*:
 ### Number of Elements
 */
fruitsSet.count

if !fruitsSet.isEmpty {
  print("\(fruitsSet.count) element(s)")
} else {
  print("empty set")
}

/*:
 ### Searching
 */
if fruitsSet.contains("Apple") {
  
}

let productSet: Set = ["iPhone", "iPad", "Mac Pro", "iPad Pro", "Macbook Pro"]
let filteredSet = productSet.filter { (element) -> Bool in
  return element.hasPrefix("i")
}

filteredSet


/*:
 ### Add a New Element
 */

//[1,2,3].append(1)
//[1,2,3].insert(2, at: 0)

var set: Set<String> = []
set.insert("Apple")
set

var result = set.insert("Orange")
result
set

result = set.insert("Orange")
result
set


/*:
 ### Remove an Element
 */
set = ["Apple", "Orange", "Melon"]

if let removed = set.remove("Apple") {
  print("\(removed) has been removed!")
}

set

set.removeAll(keepingCapacity: true)


/*:
 ### Compare two sets
 */
var favoriteFruits = Set(["Apple", "Orange", "Melon"])
var tropicalFruits = Set(["Banana", "Papaya", "Kiwi", "Pineapple"])
//var tropicalFruits = Set(["Orange", "Melon", "Apple"])

if favoriteFruits == tropicalFruits {
  print("favoriteFruits == tropicalFruits")
} else {
  print("favoriteFruits != tropicalFruits")
}

if favoriteFruits.elementsEqual(tropicalFruits) {
  print("favoriteFruits == tropicalFruits")
} else {
  print("favoriteFruits != tropicalFruits")
}


/***************************************************
 Q. elementsEqual vs ==
 둘의 차이점은?
 ***************************************************/

var tropicalFruits1 = Set(["Apple", "Orange", "Melon"])
var tropicalFruits2 = Set(["Orange", "Melon", "Apple"])



/*:
 ---
 ## Fundamental Set Operations
 - intersection - 교집합
 - union - 합집합
 - subtracting - 차집합
 - symmetricDifference - 교집합의 여집합
 ---
 */

//: ![Set](FundamentalSetOperations.png)



/*:
 ### intersection
 */
favoriteFruits = Set(["Apple", "Orange", "Melon", "Kiwi"])
tropicalFruits = Set(["Banana", "Papaya", "Kiwi", "Pineapple"])

if favoriteFruits.isDisjoint(with: tropicalFruits) {
  print("favoriteFruits ∩ tropicalFruits = ∅")
} else {
  print("favoriteFruits ∩ tropicalFruits")
}

let commonSet = favoriteFruits.intersection(tropicalFruits)
commonSet

tropicalFruits.formIntersection(favoriteFruits)
tropicalFruits


/*:
 ### union
 */

favoriteFruits = Set(["Apple", "Orange", "Melon", "Kiwi"])
tropicalFruits = Set(["Banana", "Papaya", "Kiwi", "Pineapple"])

var unionSet = favoriteFruits.union(tropicalFruits)
unionSet

unionSet = favoriteFruits
unionSet.formUnion(tropicalFruits)
unionSet

/*:
 ### intersection
 */
let uncommonSet = favoriteFruits.subtracting(tropicalFruits)
uncommonSet

favoriteFruits.subtract(tropicalFruits)
favoriteFruits

/*:
 ### symmetricDifference
 */
favoriteFruits = Set(["Apple", "Orange", "Melon", "Kiwi"])
tropicalFruits = Set(["Banana", "Papaya", "Kiwi", "Pineapple"])

let exclusiveSet = favoriteFruits.symmetricDifference(tropicalFruits)
exclusiveSet

favoriteFruits.formSymmetricDifference(tropicalFruits)
favoriteFruits



//: [Next](@next)

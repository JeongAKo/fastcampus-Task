//
//  Pets.swift
//  CustomLogExample
//
//  Created by giftbot on 28/05/2019.
//  Copyright © 2019 giftbot. All rights reserved.
//

import Foundation

class Dog: NSObject{
  
  let name = "Tory"
  let age = 5
  let feature: [String: String] = [
    "breed": "Poodle",
    "tail": "short"
  ]
  
  override var debugDescription: String {
    return "Dog's name: \(name), age: \(age), feature: \(feature)"
  }
  
  override var description: String {
    return "Dog's name: \(name), age: \(age)"
  }
  
//  var
}

struct Cat: CustomDebugStringConvertible, CustomStringConvertible {
  let name = "Lilly"
  let age = 2
  let feature: [String: String] = [
    "breed": "Koshort",
    "tail": "short"
  ]
  
  var description: String {
    return "Cat's name: \(name), age: \(age)"
  }
  
  var debugDescription: String {
    return "Cat's name: \(name), age: \(age), feature: \(feature)"
  }
}

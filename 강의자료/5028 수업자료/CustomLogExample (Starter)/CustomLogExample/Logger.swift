//
//  Logger.swift
//  CustomLogExample
//
//  Created by giftbot on 28/05/2019.
//  Copyright © 2019 giftbot. All rights reserved.
//

import Foundation

func logger (
  _ contents: Any...,
  header: String = "",
  _ file: String = #file,
  _ fucntion: String = #function,
  _ line: Int = #line
  ) {
  let emoji = "\n 🥰"
  let dateFormatter = DateFormatter()
  dateFormatter.dateFormat = "HH:mm:ss:SSS"
  let timestamp = dateFormatter.string(from: Date())
  
  let fileUrl = URL(fileURLWithPath: file)
  let fileName = fileUrl.deletingPathExtension().lastPathComponent
  
  let header = header.isEmpty ? "" : " [\(header)] "
  let content = contents.reduce("") {
    $0 + emoji + String(describing: $1)
  }
  
  let printString = """
  \(timestamp) / \
  \(fileName) / \(fucntion) \(line) \
  \(emoji)\(header)\(content)
  """
  
  print(printString)
}

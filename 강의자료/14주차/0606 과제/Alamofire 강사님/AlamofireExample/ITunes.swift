//
//  ITunes.swift
//  AlamofireExample
//
//  Created by giftbot on 07/06/2019.
//  Copyright © 2019 giftbot. All rights reserved.
//

import Foundation

struct ITunes: Decodable {
  let resultCount: Int
  let results: [Song]
  
  struct Song: Decodable {
    let artistName: String
    let trackName: String
    let artworkUrl100: String
  }
}

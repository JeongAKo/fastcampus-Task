//
//  dataModel.swift
//  tableSection
//
//  Created by Daisy on 01/05/2019.
//  Copyright © 2019 고정아. All rights reserved.
//

import Foundation

struct MenuData {
    let category: String
    let products: [Product]
}

struct Product {
    let name: String
    let price: Int
}

let menuDatas: [MenuData] = [
    MenuData(category: "클래식", products:
        
        [ Product(name: "슈퍼디럭스", price: 35900),
        Product(name: "슈퍼슈프림", price: 25900),
        Product(name: "베이컨체다치즈", price: 31900),
        Product(name: "불고기", price: 25900),
        Product(name: "페퍼로니", price: 25900), ]
    ),
    MenuData(category: "사이드디시", products:
        [
        Product(name: "딸기슈크림", price: 25900),
        Product(name: "슈퍼곡물치킨", price: 25900),
        Product(name: "애플 크러스트 디저트", price: 3800),
        Product(name: "치킨퐁듀 그라탕", price: 8800),
        Product(name: "퀴노아 치킨 샐러드", price: 7800),
        Product(name: "애플크러스트 디저트", price: 7800),
        Product(name: "치킨퐁듀", price: 7800),
        Product(name: "퀴노아 치킨샐러드", price: 7800),
        Product(name: "포테이토 순살치킨", price: 7800),
        Product(name: "음료", price: 7800),
        ]
    ),
    MenuData(category: "음료", products:
        [
        Product(name: "코카콜라", price: 25900),
        Product(name: "사이다", price: 25900),
        Product(name: "오렌지쥬스", price: 25900),
        Product(name: "체리에이드", price: 25900),
        ]
    ),
]


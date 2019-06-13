//
//  ForecastType.swift
//  WeatherForecast
//
//  Created by Daisy on 13/06/2019.
//  Copyright © 2019 giftbot. All rights reserved.
//

import Foundation


// CaseIterable 4.2 부터 생김

enum ForecastTypr: Int, CaseIterable {
    case current
    case shortRange
}

func asdf() {
    print(ForecastTypr.allCases.count)
    // 배열 형태로 케이스 나옴
}

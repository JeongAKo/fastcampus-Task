//
//  JsonData.swift
//  WeatherForecast
//
//  Created by Daisy on 11/06/2019.
//  Copyright © 2019 giftbot. All rights reserved.
//

import Foundation

struct CurrentWeather {
    let tc: String?
    let tmax: String?
    let tmin: String?
    
    let dataFommatta = DateFormatter()
    


    // FIXME: - init 할때 datafomatta String 으로 뒤에 하나 떼기!
    init?(from json: [String : Any]) {
        
        guard let tc = json["tc"] as? String,
            let tmax = json["tmax"] as? String,
            let tmin = json["tmin"] as? String
            else { return nil }
        
        self.tc = String(tc.dropLast(1))
        self.tmax = String(tmax.dropLast(1))
        self.tmin = String(tmin.dropLast(1))
    }
}

struct LocalInfo {
    let city: String?
    let county: String?
    let village: String?
    
    init?(from json: [String: Any]) {
        guard let city = json["city"] as? String,
            let county = json["county"] as? String,
            let village = json["village"] as? String
            else {return nil}
        self.city = city
        self.county = county
        self.village = village
    }
}

struct SkyINfo {
    let code: String?
    let name: String?
    
    init?(from json: [String: Any]) {
        guard let code = json["code"] as? String,
        let name = json["name"] as? String
            else {return nil}
        self.code = code
        self.name = name
    }
}


struct ForecastThreedays {
    let skyArray: [String]?
    let tempArray: [String]?
    let timeReleseArray: [Date]?
    
    init?(sky: [String: Any], temp: [String: Any], time: String) {
        var tempSkyArray = [String]()
        var tempTempArray = [String]()
        var tempTimeArray = [Date]()
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        for hour in stride(from: 4, through: 67, by: 3) {
            guard let sky = sky["code\(hour)hour"] as? String,
                  let temp = temp["temp\(hour)hour"] as? String,
                  let releaseTime = dateFormatter.date(from: time)
            else {return nil}
            
            guard !sky.isEmpty, !temp.isEmpty else {continue}
            
            let time = releaseTime.addingTimeInterval(TimeInterval(hour) * 3600)
            
            tempSkyArray.append(sky)
            tempTempArray.append(temp)
            tempTimeArray.append(time)
        }
        self.timeReleseArray = tempTimeArray
        self.skyArray = tempSkyArray
        self.tempArray = tempTempArray
    }
    
    func getListCount () -> Int {
        guard let sky = skyArray, let temp = tempArray else { return 0}
        print(sky.count, temp.count)
        return sky.count <= temp.count ? sky.count : temp.count
    }
}

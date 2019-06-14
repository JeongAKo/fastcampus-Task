//
//  WeatherApiControl.swift
//  WeatherForecast
//
//  Created by Daisy on 12/06/2019.
//  Copyright © 2019 giftbot. All rights reserved.
//

import Foundation

class WeatherApiControl {
    
    static let shared = WeatherApiControl()
    
    // FIXME: - 나중에 좌표 받아서 변환해주기
    
    func nowTempInfo(completionHandler: @escaping (CurrentWeather, LocalInfo, SkyINfo) -> ()) {
        guard var geturl = URLComponents(string: "https://api2.sktelecom.com/weather/current/hourly") else {return print("url error")}
        geturl.queryItems = [URLQueryItem(name: "appKey", value: "5b3c8415-c24d-4250-926f-ad16cebe50a0"),
                             URLQueryItem(name: "version", value: "2"),
                             URLQueryItem(name: "lat", value: "37.11776"),
                             URLQueryItem(name: "lon", value: "127.09776")
        ]
        guard let apiURL = geturl.url else {return print("can't convert URL")}
//        print(apiURL)
        
        URLSession.shared.dataTask(with: apiURL) { (data, response, error) in
            guard error == nil else {return print(error!)}
            guard let response = response as? HTTPURLResponse,
                200..<400 ~= response.statusCode else {return print("StatusCode not vaild")}
            guard let data = data,
                let jsonObject = try? JSONSerialization.jsonObject(with: data) as? [String: Any]
                else {return print("No data")}
            guard let weather = jsonObject["weather"] as? [String: Any] else {return print("weather error!")}
            guard let hourly = weather["hourly"] as? [ [String: Any] ] else {return print("hourly error!")}
            guard let temperature = (hourly[0])["temperature"] as? [String: String] else { return }
            guard let grid = (hourly[0])["grid"] as? [String: String] else { return }
            guard let sky = (hourly[0])["sky"] as? [String: String] else { return }
            
            guard let currentWeather = CurrentWeather(from: temperature) else {return print("current error")}
            guard let localInfo = LocalInfo(from: grid) else {return print("localInfo error!")}
            guard let skyInfo = SkyINfo(from: sky)else {return print("skyInfo error")}
            
//            print("currentWeather: ", currentWeather)
//            print("localInfo: ", localInfo)
//            print("sky: ", sky)
            
            completionHandler(currentWeather, localInfo, skyInfo)
            }.resume()
    }
    
    // FIXME: - 좌표 받아서 적용
    
    func timeIntervalThreeHours(completionHandler: @escaping (ForecastThreedays) -> ()) {
        guard var getUrl = URLComponents(string: "https://api2.sktelecom.com/weather/forecast/3days?appKey") else {return print("url error")}
        getUrl.queryItems = [URLQueryItem(name: "appKey", value: "5b3c8415-c24d-4250-926f-ad16cebe50a0"),
                             URLQueryItem(name: "version", value: "2"),
                             URLQueryItem(name: "lat", value: "37.11776"),
                             URLQueryItem(name: "lon", value: "127.09776")
        ]
        guard let apiURL = getUrl.url else {return print("can't convert URL")}
        
        print("apiURL: ", apiURL)
        
        URLSession.shared.dataTask(with: apiURL) { (data, response, error) in
            guard error == nil else {return print(error!)}
            guard let response = response as? HTTPURLResponse,
                200..<400 ~= response.statusCode else {return print("StatusCode not vaild")}
            guard let data = data,
                let jsonObject = try? JSONSerialization.jsonObject(with: data) as? [String: Any]
                else {return print("No data")}
            
            guard let weather = jsonObject["weather"] as? [String: Any] else {return print("weather error")}
            guard let forecast3days = weather["forecast3days"] as? [[String: Any]] else {return print("forecast3days error")}
            
            guard let time = (forecast3days[0])["timeRelease"] as? String else {return print("time error")}
            
            guard let fcst3hour = (forecast3days[0])["fcst3hour"] as? [String: Any] else {return print("fcst3hour error")}
            guard let sky = fcst3hour["sky"] as? [String: String],
                let temperature = fcst3hour["temperature"] as? [String: String] else {return print("sky error")}
            
            guard let forecastThreedaysInfo = ForecastThreedays(sky: sky, temp: temperature, time: time) else {return print("Forecast 3days Info error")}
            
            print("ForecastThreedaysInfo: ", forecastThreedaysInfo)
            
             completionHandler(forecastThreedaysInfo)
            
            }.resume()
    }
}

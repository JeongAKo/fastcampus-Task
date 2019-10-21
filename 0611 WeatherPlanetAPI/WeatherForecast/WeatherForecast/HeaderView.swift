//
//  HeaderView.swift
//  WeatherForecast
//
//  Created by Daisy on 11/06/2019.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

class HeaderView: UIView {

    let nowTemp = UILabel()
    let minTemp = UILabel()
    let maxTemp = UILabel()
    let weatherIcon = UIImageView()
    let weatherLetter = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        addSubview()
        callTempInfo()
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func addSubview() {
        addSubview(nowTemp)
        addSubview(minTemp)
        addSubview(maxTemp)
        addSubview(weatherIcon)
        addSubview(weatherLetter)
    }
    
    private func callTempInfo() {
    
        WeatherApiControl.shared.nowTempInfo { (temperature, grid, sky) in
            
            DispatchQueue.main.async {
                self.weatherIcon.image = UIImage(named: sky.code ?? "")
                self.weatherLetter.text = sky.name
                self.maxTemp.text = "⤒" + (temperature.tmax ?? "")
                self.minTemp.text = "⤓" + (temperature.tmin ?? "")
                self.nowTemp.text = (temperature.tc ?? "") + "º"
            }
        }
    }
    
    private func configure() {
        nowTemp.frame = CGRect(x: 50, y: 645, width: 400, height: 100)
        nowTemp.text = "현재 기온"
        nowTemp.font = .systemFont(ofSize: 55)
        nowTemp.textColor = .white
        
        minTemp.frame = CGRect(x: 52, y: 630 , width: 100, height: 50)
        minTemp.text = "최저 기온"
        minTemp.font = .systemFont(ofSize: 17)
        minTemp.textColor = .white
        
        maxTemp.frame = CGRect(x: 130, y: 630, width: 100 , height: 50)
        maxTemp.text = "최고 기온"
        maxTemp.font = .systemFont(ofSize: 17)
        maxTemp.textColor = .white
        
        weatherIcon.frame = CGRect(x: 45, y: 590, width: 50 , height: 50)
        weatherIcon.image = UIImage(named: "SKY_01")
        weatherIcon.contentMode = .scaleAspectFit
        
        weatherLetter.frame = CGRect(x: 100, y: 592, width: 100, height: 50)
        weatherLetter.text = "맑음"
        weatherLetter.font = .systemFont(ofSize: 25)
        weatherLetter.textColor = .white
        
        
    }

}

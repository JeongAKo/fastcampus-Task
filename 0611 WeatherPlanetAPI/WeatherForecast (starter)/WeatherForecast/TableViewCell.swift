//
//  TableViewCell.swift
//  WeatherForecast
//
//  Created by Daisy on 11/06/2019.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
//    var weatherData : []
    
    
    @IBOutlet weak var date: UILabel! = UILabel()
    @IBOutlet weak var temperatureHours: UILabel!
    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var temperature: UILabel!
    
    
    var weatherData: (String, String, Date)? {
        didSet {
            temperature.text = weatherData!.0
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "M:dd (E)"
            date.text = dateFormatter.string(from: weatherData!.2)
            
            dateFormatter.dateFormat = "hh:mm"
            temperatureHours.text = dateFormatter.string(from: weatherData!.2)
            let sky = "SKY_O" + weatherData!.1.dropFirst(5)
            weatherIcon.image = UIImage(named: sky)
            
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
}

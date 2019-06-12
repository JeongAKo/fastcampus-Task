//
//  TableViewCell.swift
//  WeatherForecast
//
//  Created by Daisy on 11/06/2019.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var temperatureHours: UILabel!
    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var temperature: UILabel!
    
    
    
}

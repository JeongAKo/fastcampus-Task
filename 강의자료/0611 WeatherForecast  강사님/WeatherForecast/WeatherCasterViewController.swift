//
//  ViewController.swift
//  WeatherForecast
//
//  Created by giftbot on 11/06/2019.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

final class WeatherCasterViewController: UIViewController {
       
    // DI 의존성 주입  // MARK: - ?
    private var forecastService: ForecastServiceType?
    
    // model
    var currentForecast: CurrentForecast?
    
    init(forecastService: ForecastServiceType) {
    super.init(nibName: nil, bundle: nil)
    self.forecastService = forecastService
    }
    required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
    super.viewDidLoad()
        
        forecastService?.fetchShortRangeForecast(latitude: 0, longitude: 0, completionHandler: { result in
            switch result {
            case .success(let value):
                print(value)
            case .failure(let error):
                print(error.localizedDescription)
            }
        })
    
    }
    
    
    func aaaaa() {
    forecastService?.fetchCurrentForecast(
    latitude: 0,
    longitude: 0
    ) { result in
    switch result {
    case .success(let value):
    print(value)
    case .failure(let error):
    print(error.localizedDescription)
    }
    }
    }
}

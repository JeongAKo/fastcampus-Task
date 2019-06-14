//
//  ViewController.swift
//  WeatherForecast
//
//  Created by giftbot on 11/06/2019.
//  Copyright © 2019 Daisy. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {
    
    let imageView = UIImageView()
    let tableView = UITableView()
    let hearderView = HeaderView()
    let topView = TopView()
    
    var forecastThreedays: ForecastThreedays?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        autoLayout()
      
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        getWeatherInfo()
    }
    
    private func configure() {
        view.addSubview(imageView)
        view.addSubview(topView)
        view.addSubview(tableView)
        
        imageView.image = UIImage(named: "sunny")
        
        topView.backgroundColor = .clear
 
        hearderView.backgroundColor = .clear
        hearderView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height - 120)
        tableView.separatorStyle = .none
        tableView.tableHeaderView = hearderView
        tableView.backgroundColor = .clear
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "Cell")
        tableView.rowHeight = 70
    }
    
    private func autoLayout() {
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        topView.translatesAutoresizingMaskIntoConstraints = false
        topView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        topView.leadingAnchor.constraint(equalTo: imageView.leadingAnchor).isActive = true
        topView.trailingAnchor.constraint(equalTo: imageView.trailingAnchor).isActive = true
        topView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: topView.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: imageView.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: imageView.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: imageView.bottomAnchor).isActive = true
        
    }
    
    private func getWeatherInfo() {
        WeatherApiControl.shared.timeIntervalThreeHours { weatherData in
            print("getWeatherInfo")
            self.forecastThreedays = weatherData
            
            
            
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}

extension WeatherViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("numberOfRowsInSection")
        return forecastThreedays?.getListCount() ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell

        cell.date.textColor = .white
        cell.temperature.textColor = .white
        cell.temperatureHours.textColor = .white
        
        cell.weatherData = (forecastThreedays!.tempArray![indexPath.row],
                            forecastThreedays!.skyArray![indexPath.row],
                            forecastThreedays!.timeReleseArray![indexPath.row])
        
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        // 이걸로 뒷배경 움직이게 하는고
    }

}




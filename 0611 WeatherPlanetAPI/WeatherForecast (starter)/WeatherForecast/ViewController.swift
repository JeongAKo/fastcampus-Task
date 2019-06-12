//
//  ViewController.swift
//  WeatherForecast
//
//  Created by giftbot on 11/06/2019.
//  Copyright © 2019 Daisy. All rights reserved.
//

//현재 날씨는 codable
//단기는 시리얼라이쩨이션


import UIKit

class ViewController: UIViewController {
    
    let imageView = UIImageView()
    let tableView = UITableView()
    let hearderView = HeaderView()
    let topView = TopView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        nowTempInfo()
        futureTempInfo()
        autoLayout()
    }
    
    private func configure() {
        view.addSubview(imageView)
        view.addSubview(topView)
        view.addSubview(tableView)
        
        imageView.image = UIImage(named: "sunny")
        
        //
        topView.backgroundColor = .yellow
      
        //
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
    
    // FIXME: - 나중에 좌표 받아서 변환해주기
    private func nowTempInfo() {
        guard var geturl = URLComponents(string: "https://api2.sktelecom.com/weather/current/hourly") else {return print("url error")}
        geturl.queryItems = [URLQueryItem(name: "appKey", value: "5b3c8415-c24d-4250-926f-ad16cebe50a0"),
                           URLQueryItem(name: "version", value: "2"),
                           URLQueryItem(name: "lat", value: "37.11776"),
                           URLQueryItem(name: "lon", value: "127.09776")
        ]
        guard let apiURL = geturl.url else {return print("can't convert URL")}
        
        
        
        

    }
    
    private func futureTempInfo() {
    
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
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
        
        cell.date.text = "date"
        cell.temperature.text = "temperature"
        cell.temperatureHours.text = "temperatureHours"
        cell.weatherIcon.image = UIImage(named: "SKY_01")
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        // 이걸로 뒷배경 움직이게 하는고
    }

}




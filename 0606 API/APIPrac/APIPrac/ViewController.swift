//
//  ViewController.swift
//  APIPrac
//
//  Created by Daisy on 08/06/2019.
//  Copyright © 2019 고정아. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var searchSinger: String?
    let tableView = UITableView()
    var dataArray: [Singer] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        view.addSubview(tableView)
        autoLayout()
        getInfo()
    }
    
    
    private func getInfo() {
        
        guard var comp = URLComponents(string: "https://itunes.apple.com/search?") else {return print("")}
        comp.queryItems = [URLQueryItem(name: "media", value: "music"),
                            URLQueryItem(name: "entity", value: "song"),
                            URLQueryItem(name: "term", value: "taylor swift")]
        
        guard let apiURL = comp.url else {return print("can't convert URL")}
        
        let dataTask = URLSession.shared.dataTask(with: apiURL) { (data, response, error) in
            guard error == nil else {return print(error!)}
            guard let response = response as? HTTPURLResponse,
            200..<400 ~= response.statusCode
                else {return print("Stasud not vaild")}
            guard let data = data,
                let jsonObject = try? JSONSerialization.jsonObject(with: data) as? [String: Any]
                else {return print("No data")}
            guard let singer = jsonObject["results"] as? [[String:Any]] else {return}
            
            
            for seperate in singer {
                
                guard let artistName = seperate["artistName"] as? String,
                let trackName = seperate["trackName"] as? String,
                let artworkUrl100 = seperate["artworkUrl100"] as? String
                    else {continue}
                
                self.dataArray = [Singer(artistName: artistName, trackName: trackName, artworkUrl100: artworkUrl100)]
                
                data
                
                print(self.dataArray)
                
            }
        }
        
        dataTask.resume()
    }
    
    

    private func autoLayout() {
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    
    }

}


extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        return
    }


}


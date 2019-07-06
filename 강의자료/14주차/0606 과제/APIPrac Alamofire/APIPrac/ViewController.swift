//
//  ViewController.swift
//  APIPrac
//
//  Created by Daisy on 08/06/2019.
//  Copyright © 2019 고정아. All rights reserved.
//

import UIKit
import Alamofire


class ViewController: UIViewController {
    
    let searchController = UISearchController(searchResultsController: nil)
    
    var searchSinger: String?
    let tableView = UITableView()
    var dataArray: [Singer] = []
    
//    override func viewDidAppear(_ animated: Bool) {
//        getInfo("Buzz")
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        view.addSubview(tableView)
        autoLayout()
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.searchController = searchController
        print("navigationController: ",self.navigationController)
        //검색할때 뒷배경 흐리게
        self.searchController.obscuresBackgroundDuringPresentation = true
        //setup other SearchController Setting
        self.searchController.searchBar.placeholder = "Search"
        self.searchController.searchBar.sizeToFit()
        self.searchController.searchBar.delegate = self
    }

    private func getJSonInfo(_ searchSong: String) {
        guard var comp = URLComponents(string: "https://itunes.apple.com/search?") else {return print("")}
        comp.queryItems = [URLQueryItem(name: "media", value: "music"),
                           URLQueryItem(name: "entity", value: "song"),
                           URLQueryItem(name: "term", value: searchSong)]
        
        let req = AF.request(comp)
        
        req.validate()
            .responseJSON { (response) in
                switch response.result {
                case .success(let value):
                    print("value: ", value)
                    guard let dictionary = value as? [String: Any],
                    let array = dictionary["results"] as? [[String: Any]]
                    else {return print("fail")}
                    
                    for seperate in array {
                        guard let artistName = seperate["artistName"] as? String,
                            let trackName = seperate["trackName"] as? String,
                            let artworkUrl100 = seperate["artworkUrl100"] as? String
                            else {continue}
                        
                        let url = URL(string: artworkUrl100)!
                        if let data = try? Data(contentsOf: url) {
            
                            self.dataArray.append(Singer(artistName: artistName, trackName: trackName, artworkUrl100: UIImage(data: data)!))
                        }
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                        }
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                }
        }
    }
    
    private func getInfo(_ searchSong: String) {
        guard var comp = URLComponents(string: "https://itunes.apple.com/search?") else {return print("")}
        comp.queryItems = [URLQueryItem(name: "media", value: "music"),
                           URLQueryItem(name: "entity", value: "song"),
                           URLQueryItem(name: "term", value: searchSong)]

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

                let url = URL(string: artworkUrl100)!
                if let data = try? Data(contentsOf: url) {
//                    let image = UIImage(data: data)! 이렇게 해도..
                    self.dataArray.append(Singer(artistName: artistName, trackName: trackName, artworkUrl100: UIImage(data: data)!))
                }
//                print(self.dataArray)

                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
            
            print("final: ",self.dataArray)
        }
        dataTask.resume()
    }
    
    private func autoLayout() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
}


extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell: UITableViewCell
        if let reusableCell = tableView.dequeueReusableCell(withIdentifier: "cell") {
            cell = reusableCell
        } else {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        }
        
        cell.textLabel?.text = self.dataArray[indexPath.row].trackName
        cell.detailTextLabel?.text = self.dataArray[indexPath.row].artistName
        cell.imageView?.image = self.dataArray[indexPath.row].artworkUrl100
        
        return cell
    }
}


extension ViewController: UISearchBarDelegate {
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        
        guard let text = searchBar.text else {return print("couldn't get text")}
        getJSonInfo(text)
//        getInfo(text)
    }
   
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        
    }
    
}

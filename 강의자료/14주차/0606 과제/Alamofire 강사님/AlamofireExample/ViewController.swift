//
//  ViewController.swift
//  AlamofireExample
//
//  Created by giftbot on 07/06/2019.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
  
  @IBOutlet private weak var tableView: UITableView!
  @IBOutlet private weak var indicatorView: UIActivityIndicatorView!
  
  let searchController = UISearchController(searchResultsController: nil)
  var baseUrl = "https://itunes.apple.com/search?media=music&entity=song&term="
  var songs: [ITunes.Song] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    searchController.searchBar.delegate = self
    searchController.searchBar.placeholder = "Search Songs"
    navigationItem.searchController = searchController
    definesPresentationContext = true
  }
}

// MARK: - UITableViewDataSource

extension ViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return songs.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
    let song = songs[indexPath.row]
    cell.textLabel?.text = song.trackName
    cell.detailTextLabel?.text = song.artistName

    AF.request(song.artworkUrl100)
      .validate(contentType: ["image/jpeg"])
      .responseData { response in
        guard let data = try? response.result.get() else { return }
        guard let cell = tableView.cellForRow(at: indexPath) else { return }
        cell.imageView?.image = UIImage(data: data)
    }

    return cell
  }
}


// MARK: - UISearchBarDelegate

extension ViewController: UISearchBarDelegate {
  func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
    guard let trackName = searchBar.text, !trackName.isEmpty else { return }
    indicatorView.startAnimating()
    
    AF.request(baseUrl + trackName)
      .validate()
      .responseDecodable { [weak self] (response: DataResponse<ITunes>) in
        switch response.result {
        case .success(let value):
          self?.songs = value.results
          self?.tableView.reloadData()
        case .failure(let error):
          print(error.localizedDescription)
        }
        self?.indicatorView.stopAnimating()
    }
  }
}



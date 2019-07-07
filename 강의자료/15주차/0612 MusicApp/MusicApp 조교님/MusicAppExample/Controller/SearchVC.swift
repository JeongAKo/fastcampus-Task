//
//  SearchVC.swift
//  URLSessionPractice
//
//  Created by Wi on 10/06/2019.
//  Copyright © 2019 Wi. All rights reserved.
//

import UIKit
import AVKit

class SearchVC: UITableViewController {
    
    // MARK: - Properties
    
    private let searchController = UISearchController(searchResultsController: nil)
    
    var tracks = [Track]()
    var currentTrack: Track? {
        didSet {
        
        }
    }
    
    var player: AVPlayer?
    var searchWord: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "iTunes Search"
        
        // seach controller contigure
        searchControllerConfigure()
        
        // search data configure
        getSearchData(searchTerm: "장범준")
        
        // cell register
        tableView.register(TrackCell.self, forCellReuseIdentifier: "cell")
        tableView.register(CurrentPlayMusicFooterView.self, forHeaderFooterViewReuseIdentifier: "PlayingView")
        
        // tableView separatorInset
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 90, bottom: 0, right: 0)
    }
    
    // MARK: - Configuration
    
    private func searchControllerConfigure(){
        self.navigationItem.searchController = searchController
        searchController.searchResultsUpdater = self
        searchController.delegate = self
        searchController.searchBar.placeholder = "Search music"
        searchController.obscuresBackgroundDuringPresentation = true
    }
    
    // MARK: - TableView
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tracks.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TrackCell
        if tracks.count > indexPath.row {
            cell.track = tracks[indexPath.row]
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let url = URL(string: tracks[indexPath.row].previewUrl) else {return}
        guard let footerView = tableView.footerView(forSection: 0) as? CurrentPlayMusicFooterView else {return}
        
        currentTrack = tracks[indexPath.row]
        footerView.track = currentTrack
        footerView.isPlaying = true
        
        player = AVPlayer(url: url)
        player!.play()
        
    }
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "PlayingView") as! CurrentPlayMusicFooterView
        footerView.delegate = self
        return footerView
    }
    
    // MARK: - Networking
    
    private func getSearchData(searchTerm: String){
        
        
        let defualtSession = URLSession(configuration: .default)
        
        guard var urlComponents = URLComponents(string: "https://itunes.apple.com/search") else {return}
        urlComponents.query = "media=music&entity=song&term=\(searchTerm)"
        
        guard let url = urlComponents.url else {return}
        
        let dataTask = defualtSession.dataTask(with: url) { (data, response, error) in
            
            if let error = error{
                print(error.localizedDescription)
            } else if let data = data,
                      let response = response as? HTTPURLResponse,
                response.statusCode == 200{
                do {
                    let result = try JSONDecoder().decode(Result.self, from: data)
                    self.tracks = result.results
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                } catch {
                    print(error.localizedDescription)
                }
                
            }
        }
        dataTask.resume()
    }
    
}

extension SearchVC: CurrentPlayMusicFooterViewDelegate{
    func playPauseButtonDidTap(footerView: CurrentPlayMusicFooterView) {
        guard let player = self.player else {return}
        
        if footerView.isPlaying{
            player.pause()
        } else {
            player.play()
        }
        footerView.isPlaying.toggle()
    }
}


extension SearchVC: UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        if searchWord != nil{
            getSearchData(searchTerm: searchWord!)
        } else {
            getSearchData(searchTerm: searchBar.text!)
        }
        
    }
    
    
}

extension SearchVC: UISearchControllerDelegate{
    func willDismissSearchController(_ searchController: UISearchController) {
        searchWord = searchController.searchBar.text
    }
}


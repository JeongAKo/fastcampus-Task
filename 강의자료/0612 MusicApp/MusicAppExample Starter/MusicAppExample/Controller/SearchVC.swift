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
    
    // MARK: - properties
    
    
    private let searchController = UISearchController(searchResultsController: nil)
    
    var tracks = [Track]()
    var player: AVPlayer?
    var searchWord: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //search controller configure
        searchControllerConfigure()
        
        //search data configure
        getSearchData(searchTerm: "멜로망스")
        
        
        //cell register
        tableView.register(TrackCell.self, forCellReuseIdentifier: "cell")
        tableView.register(CurrentPlayMusicFooterView.self, forHeaderFooterViewReuseIdentifier: "playingView")
        
        // tableView seperatorInset
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 90, bottom: 0, right: 0)
        
    
    }
    
    
    // MARK: - configuratiom
    
    private func searchControllerConfigure() {
        self.navigationItem.searchController = searchController
        searchController.searchResultsUpdater = self
        searchController.searchBar.placeholder = "Searsh Music"
        searchController.obscuresBackgroundDuringPresentation = true
        searchController.delegate = self
    }
    
    // MARK: -TableView
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        print(tracks.count)
            return tracks.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TrackCell
        cell.track = self.tracks[indexPath.row]
//        print(self.tracks[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let url = URL(string: tracks[indexPath.row].previewUrl) else {return}
        
        guard let footerView = tableView.footerView(forSection: 0 ) as?
            CurrentPlayMusicFooterView else {return}
        footerView.track = tracks[indexPath.row]
        footerView.isPlaying = true
                
        
//        player = AVPlayer(playerItem: AVPlayerItem(url: <#T##URL#>)) ← 원래 이렇게 하는게 맞음
        
        player = AVPlayer(url: url)
        
        let avPlayerController = AVPlayerViewController()
//        avPlayerController.player = player
//        present(avPlayerController, animated: true)  //새로운 창으로 올라오는것

        
        player!.play()
    }
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "playingView") as! CurrentPlayMusicFooterView
        footerView.delegate = self
        return footerView
    }
    
    // MARK: - networking
    
    private func getSearchData(searchTerm: String) {
        
        let defaultSession = URLSession(configuration: .default)
        
        guard var urlComponent = URLComponents(string: "https://itunes.apple.com/search") else  {return}
        urlComponent.query = "media=music&entity=song&term=\(searchTerm)"
        
        guard let url = urlComponent.url else {return}
        
        let dataTask = defaultSession.dataTask(with: url) { (data, response, error) in
            
            // error
            if let error = error{
                print(error.localizedDescription)
            } else if let data = data,
                let response = response as? HTTPURLResponse,
                response.statusCode == 200 {
                
                do {
                    let result = try JSONDecoder().decode(Result.self, from: data)
                    
                    self.tracks = result.results
//                    print(self.tracks)
                    
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

extension SearchVC: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        if searchWord != nil{
            getSearchData(searchTerm: searchWord!)
        } else {
            getSearchData(searchTerm: searchBar.text!)
        }
    }
}

extension SearchVC: CurrentPlayMusicFooterViewDelegate {
    func playPauseButtonDidTap(footerView: CurrentPlayMusicFooterView) {
        guard let player = self.player else {return}
        
        if footerView.isPlaying {
            player.pause()
        } else {
            player.play()
        }
        footerView.isPlaying.toggle()
    }
    
    
}
extension SearchVC: UISearchControllerDelegate {
    func willDismissSearchController(_ searchController: UISearchController) {
        print("willDismiss SearchBar Text: ", searchController.searchBar.text)
        searchWord = searchController.searchBar.text
    }
    
}



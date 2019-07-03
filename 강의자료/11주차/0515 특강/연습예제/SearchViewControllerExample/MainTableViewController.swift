//
//  MainTableViewController.swift
//  SearchViewControllerExample
//
//  Created by Wi on 11/05/2019.
//  Copyright © 2019 Wi. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController {
    
    let searchController = UISearchController(searchResultsController: nil)
    var dataArray = menuData
    var filteredDataArray = [Product]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Pizza Search"
        
        dataArray.forEach{
            filteredDataArray += $0.menu
        }
       
        
         // Setup Basic SearchController Setting
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        navigationItem.searchController = searchController
        
        
        // Setup other SearchController Setting
        searchController.searchBar.placeholder = "Search"
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.scopeButtonTitles = ["All"] + menuData.map{$0.category}
        
    }

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell
        cell
        return cell
    }
    
    
    // MARK: - For Search method


}

extension MainTableViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        
    }
    
}

extension MainTableViewController: UISearchBarDelegate {
    
    
}

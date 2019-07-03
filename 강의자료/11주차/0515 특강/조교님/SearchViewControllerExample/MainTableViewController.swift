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
    var dataArr = menuData
    var filteredDataArr = [Product]()
    
    var item: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Pizza Search"
        dataArr.forEach{
            filteredDataArr += $0.menu
        }
        
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.searchController = searchController
        self.searchController.obscuresBackgroundDuringPresentation = false // 검색하는 동안 기본내용이 가려져 있을지
        self.searchController.searchResultsUpdater = self
        self.searchController.searchBar.delegate = self
        
        self.searchController.searchBar.scopeButtonTitles = menuData.map{$0.category}
        self.searchController.searchBar.scopeButtonTitles?.insert("All", at: 0)
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredDataArr.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell
        if let reusableCell = tableView.dequeueReusableCell(withIdentifier: "cell") {
            cell = reusableCell
        } else {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        }
        cell.textLabel?.text = filteredDataArr[indexPath.row].name
        cell.detailTextLabel?.text = String(filteredDataArr[indexPath.row].price)
        return cell
    }
    func searchBarIsEmpty() -> Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    func filterContentForSearchText( _ searchText: String, scope: String = "All"){
        filteredDataArr = []
        dataArr.forEach{
            let doesCategoryMatch = ($0.category == scope) || (scope == "All")
            if searchBarIsEmpty() {
                filteredDataArr += $0.menu.filter{ _ in doesCategoryMatch}
            }else{
               filteredDataArr += $0.menu.filter{ doesCategoryMatch && $0.name.contains(searchText)}
            }
        }
//        if searchBarIsEmpty() && searchController.searchBar.selectedScopeButtonIndex != 0{
//            print("1")
//            dataArr.forEach{
//                if $0.category == scope{
//                    filteredDataArr = $0.menu
//                }
//            }
//        }else if searchBarIsEmpty() && searchController.searchBar.selectedScopeButtonIndex == 0{
//            print("2")
//            dataArr.forEach{
//                filteredDataArr += $0.menu
//            }
//        }else if !searchBarIsEmpty() && searchController.searchBar.selectedScopeButtonIndex == 0{
//            print("3")
//            dataArr.forEach{
//                filteredDataArr += $0.menu.filter{$0.name.contains(searchText)}
//            }
//        }
//        else{
//            print("4")
//            let arr = dataArr.filter{$0.category == scope}.map{
//                $0.menu.filter{$0.name.contains(searchText)}
//            }.reduce([], +)
//            filteredDataArr = arr
//        }
        
        tableView.reloadData()
    }


}

extension MainTableViewController: UISearchResultsUpdating {
    // MARK: - UISearchResultsUpdating Delegate
    func updateSearchResults(for searchController: UISearchController) {
        // searchBar 에서 글자를 눌렀을 때
        print(searchController.searchBar.text!)
//        let searchBar = searchController.searchBar
//        let scope = searchBar.scopeButtonTitles![searchBar.selectedScopeButtonIndex]
//        filterContentForSearchText(searchController.searchBar.text!, scope: scope)
    }
}

extension MainTableViewController: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        // 스코프를 눌렀을때
         filterContentForSearchText(searchBar.text!, scope: searchBar.scopeButtonTitles![selectedScope])
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        // cancel 버튼 눌렀을때
        let searchBar = searchController.searchBar
        searchBar.selectedScopeButtonIndex = 0
    }
}

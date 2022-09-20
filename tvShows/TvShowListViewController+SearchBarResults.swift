//
//  TvShowListViewController+SearchBarResults.swift
//  tvShows
//
//  Created by teddy on 2022-09-20.
//

import Foundation
import UIKit

extension TvShowListViewController {
    func setupSearchBarController() {
        searchBarController = UISearchController(searchResultsController: nil)
        searchBarController.searchResultsUpdater = self
        searchBarController.searchBar.sizeToFit()
        tableView.tableHeaderView = searchBarController.searchBar
        searchBarController.searchBar.isHidden = true
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        
    }
}

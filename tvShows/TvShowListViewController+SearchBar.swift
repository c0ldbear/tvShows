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
        guard let text = searchController.searchBar.text?.lowercased() else {
            return
        }
        
        filteredTvShows.removeAll()
        filteredTvShows.append(contentsOf: tvShows.filter { show in
            return show.name.lowercased().contains(text)
        })
        
        if !searchController.isActive {
            filteredTvShows = tvShows
        }
        tableView.reloadData()
    }
}

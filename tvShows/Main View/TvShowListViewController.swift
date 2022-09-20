//
//  ViewController.swift
//  tvShows
//
//  Created by teddy on 2022-09-19.
//

import UIKit

class TvShowListViewController: UITableViewController, UISearchResultsUpdating {
    
    // Plan:
    // Use the Search Bar to make a search to the API, make a call first when user press enter
    // Add an activity spinner
    
    var tvShows = [TvShow]()
    var filteredTvShows = [TvShow]()
    var apiCaller = ApiCaller()
    
    var searchBarController: UISearchController!
    let activityIndicator = UIActivityIndicatorView(style: .large)
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupActivityIndicator()
        setupSearchBarController()
        activityIndicator.startAnimating()
        getAllTvShows()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "TV Shows"
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredTvShows.count > 0 ? filteredTvShows.count : 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TvShow", for: indexPath)
        let tvShow = filteredTvShows[indexPath.row]
        cell.textLabel?.text = tvShow.name
        cell.imageView?.image = UIImage(data: tvShow.imageMedium)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailView = TvShowDetailViewController()
        let tvShow = filteredTvShows[indexPath.row]
        detailView.showTitle = tvShow.name
        detailView.showGenres = tvShow.genres
        detailView.showPoster = tvShow.imageMedium
        detailView.showLang = tvShow.language
        detailView.duration = String(tvShow.duration)
        // TODO: Add more info like duration (in min),
        navigationController?.pushViewController(detailView, animated: true)
    }

}

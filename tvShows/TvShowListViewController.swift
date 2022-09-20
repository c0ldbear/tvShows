//
//  ViewController.swift
//  tvShows
//
//  Created by teddy on 2022-09-19.
//

import UIKit

class TvShowListViewController: UITableViewController, UISearchResultsUpdating {
    
    // Plan:
    // Create an ApiCaller for TV-Maze API (https://www.tvmaze.com/api)
    //      Test with api endpoint: https://api.tvmaze.com/singlesearch/shows?q=girls
    // Create a data model for the data from
    // Use the Search Bar to make a search to the API, make a call first when user press enter
    // Add an activity spinner
    
    var tvShows = [TvShow]()
    var apiCaller = ApiCaller()
    
    var searchBarController: UISearchController!
    let activityIndicator = UIActivityIndicatorView(style: .large)
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupActivityIndicator()
        setupSearchBarController()
        activityIndicator.startAnimating()
        
        DispatchQueue.global().async { [weak self] in
            guard let weakSelf = self else { return }
            if let tvShows = weakSelf.apiCaller.fetch()  {
                let sortedTvShows = tvShows.sorted {
                    $0.name!.lowercased() < $1.name!.lowercased()
                }
                var counter = 0 // TODO: REMOVE
                for showData in sortedTvShows {
                    let imageData = weakSelf.apiCaller.imageFetch(url: showData.image?["medium"] ?? "")
                    let imageOriginalData = weakSelf.apiCaller.imageFetch(url: showData.image?["original"] ?? "") // TODO: Move to when the detail view is loading
                    let show = TvShow(name: showData.name!,
                                      genres: showData.genres!,
                                      imageMedium: imageData ?? Data(),
                                      imageOriginal: imageOriginalData ?? Data())
                    weakSelf.tvShows.append(show)
                    
                    // TODO: REMOVE
                    counter += 1
                    if counter > 10 {
                        break
                    }
                }
                
                DispatchQueue.main.async { [weak self] in
                    guard let weakSelf = self else { return }
                    weakSelf.activityIndicator.stopAnimating()
                    weakSelf.searchBarController.searchBar.isHidden = false
                    weakSelf.tableView.reloadData()
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "TV Shows"
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tvShows.count > 0 ? tvShows.count : 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TvShow", for: indexPath)
        let tvShow = tvShows[indexPath.row]
        cell.textLabel?.text = tvShow.name
        cell.imageView?.image = UIImage(data: tvShow.imageMedium)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailView = TvShowDetailViewController()
        let tvShow = tvShows[indexPath.row]
        detailView.showTitle = tvShow.name
        detailView.showGenres = tvShow.genres
        detailView.showPoster = tvShow.imageMedium
        // TODO: Add more info like duration (in min),
        navigationController?.pushViewController(detailView, animated: true)
    }

}

// TODO: Move to own file
class TvShow {
    var name: String
    var genres: [String]
    var imageMedium: Data
    var imageOriginal: Data
    
    init(name: String, genres: [String], imageMedium: Data, imageOriginal: Data) {
        self.name = name
        self.genres = genres
        self.imageMedium = imageMedium
        self.imageOriginal = imageOriginal
    }
}

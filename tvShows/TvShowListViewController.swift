//
//  ViewController.swift
//  tvShows
//
//  Created by teddy on 2022-09-19.
//

import UIKit

class TvShowListViewController: UITableViewController {
    // Plan:
    // Create a DetailView for the items in the list
    // Create an ApiCaller for TV-Maze API (https://www.tvmaze.com/api)
    //      Test with api endpoint: https://api.tvmaze.com/singlesearch/shows?q=girls
    // Create a data model for the data from
    
    var tvShows = [TvShowData]()
    var apiCaller = ApiCaller()
    
    @IBOutlet var searchTvShows: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        DispatchQueue.global().async { [weak self] in
            guard let weakSelf = self else { return }
            if let tvShows = weakSelf.apiCaller.fetch()  {
                weakSelf.tvShows = tvShows.sorted {
                    $0.name!.lowercased() < $1.name!.lowercased()
                }
                
                DispatchQueue.main.async { [weak self] in
                    guard let weakSelf = self else { return }
                    weakSelf.tableView.reloadData()
                }
            }
        }
        
        title = "TV Shows"
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tvShows.count > 0 ? tvShows.count : 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TvShow", for: indexPath)
        cell.textLabel?.text = tvShows[indexPath.row].name ?? "Tv Show #\(indexPath.row + 1)"
        cell.imageView?.image = UIImage(systemName: "film")
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailView = TvShowDetailViewController()
        detailView.showTitle = "Tv Show #\(indexPath.row + 1)"
        detailView.showGenres = "Drama"
        navigationController?.pushViewController(detailView, animated: true)
    }

}


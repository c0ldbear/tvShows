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
    
    @IBOutlet var searchTvShows: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        title = "TV Shows"
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TvShow")!
        cell.textLabel?.text = "Tv Show #\(indexPath.row + 1)"
        return cell
    }

}


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
    
    var tvShows = [TvShow]()
    var apiCaller = ApiCaller()
    
    @IBOutlet var searchTvShows: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        DispatchQueue.global().async { [weak self] in
            guard let weakSelf = self else { return }
            if let tvShows = weakSelf.apiCaller.fetch()  {
                let sortedTvShows = tvShows.sorted {
                    $0.name!.lowercased() < $1.name!.lowercased()
                }
                var counter = 0
                for showData in sortedTvShows {
                    let imageData = weakSelf.apiCaller.imageFetch(url: showData.image?["medium"] ?? "")
                    let imageOriginalData = weakSelf.apiCaller.imageFetch(url: showData.image?["original"] ?? "")
                    let show = TvShow(name: showData.name!, imageMedium: imageData ?? Data(), imageOriginal: imageOriginalData ?? Data())
                    weakSelf.tvShows.append(show)
                    
                    // TODO: REMOVE
                    counter += 1
                    if counter > 10 {
                        break
                    }
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
        let tvShow = tvShows[indexPath.row]
        cell.textLabel?.text = tvShow.name
//        cell.imageView?.image = UIImage(systemName: "film")
        cell.imageView?.image = UIImage(data: tvShow.imageMedium)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailView = TvShowDetailViewController()
        let tvShow = tvShows[indexPath.row]
        detailView.showTitle = tvShow.name
        detailView.showGenres = tvShow.name
        navigationController?.pushViewController(detailView, animated: true)
    }

}

class TvShow {
    var name: String
    var imageMedium: Data
    var imageOriginal: Data
    
    init(name: String, imageMedium: Data, imageOriginal: Data) {
        self.name = name
        self.imageMedium = imageMedium
        self.imageOriginal = imageOriginal
    }
}

//
//  TvShowListViewController+GetAllShows.swift
//  tvShows
//
//  Created by teddy on 2022-09-20.
//

import Foundation

extension TvShowListViewController {
    func getAllTvShows() {
        DispatchQueue.global().async { [weak self] in
            guard let weakSelf = self else { return }
            if let tvShows = weakSelf.apiCaller.fetch()  {
                let sortedTvShows = tvShows.sorted {
                    $0.name!.lowercased() < $1.name!.lowercased()
                }
                
                for showData in sortedTvShows {
                    let imageData = weakSelf.apiCaller.imageFetch(url: showData.image?["medium"] ?? "")
                    guard let name = showData.name,
                          let genres = showData.genres,
                          let language = showData.language,
                          let duration = showData.runtime,
                          let showImage = imageData else {
                              print("Error???")
                              return
                          }
                    
                    let show = TvShow(name: name,
                                      genres: genres,
                                      language: language,
                                      duration: duration,
                                      imageMedium: showImage)
                    weakSelf.tvShows.append(show)
                }
                weakSelf.filteredTvShows = weakSelf.tvShows
                
                // Update the UI
                DispatchQueue.main.async { [weak self] in
                    guard let weakSelf = self else { return }
                    weakSelf.activityIndicator.stopAnimating()
                    weakSelf.searchBarController.searchBar.isHidden = false
                    weakSelf.tableView.reloadData()
                }
            }
        }
    }
}

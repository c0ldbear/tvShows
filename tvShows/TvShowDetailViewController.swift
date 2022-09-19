//
//  TvShowDetailViewController.swift
//  tvShows
//
//  Created by teddy on 2022-09-19.
//

import UIKit

class TvShowDetailViewController: UIViewController {

    var imageUI: UIImageView!
    var showLangUI: UILabel!
    var showGenresUI: UILabel!
    
    var showGenres: String?
    var showTitle: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let showTitle = showTitle {
            title = showTitle
        }
        
        showGenresUI = UILabel()
        showGenresUI.translatesAutoresizingMaskIntoConstraints = false
        showGenresUI.text = showGenres ?? "lol"
        view.addSubview(showGenresUI)
        
        NSLayoutConstraint.activate([
            showGenresUI.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            showGenresUI.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor)
        ])
    }

}

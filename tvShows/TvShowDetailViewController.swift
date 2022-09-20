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
    // TODO: Add more info like duration (in min), 
    
    var showGenres: [String]?
    var showTitle: String?
    var showPoster: Data?
    
    override func loadView() {
        super.loadView()
        
        imageUI = UIImageView()
        imageUI.translatesAutoresizingMaskIntoConstraints = false
        let frame = CGRect(x: 10, y: 10, width: view.frame.width-20, height: view.frame.height)
        imageUI.image = UIImage(data: showPoster ?? Data())
        imageUI.frame = frame
        imageUI.sizeToFit()
        view.addSubview(imageUI)
        
        showGenresUI = UILabel()
        showGenresUI.translatesAutoresizingMaskIntoConstraints = false
        showGenresUI.text = "Genres: \(showGenres?.joined(separator: ", ") ?? "None found")"
        view.addSubview(showGenresUI)
        
        NSLayoutConstraint.activate([
            imageUI.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 25),
            imageUI.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            showGenresUI.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            showGenresUI.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor)
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let showTitle = showTitle {
            title = showTitle
        }
    }

}

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
    var durationUI: UILabel!
    // TODO: Add more info like duration (in min),
    
    var showGenres: [String]?
    var showTitle: String?
    var showLang: String?
    var showPoster: Data?
    var duration: String?
    
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
        if let showGenres = showGenres {
            showGenresUI.text = "Genres: \(showGenres.joined(separator: ", "))"
        }
        view.addSubview(showGenresUI)
        
        showLangUI = UILabel()
        showLangUI.translatesAutoresizingMaskIntoConstraints = false
        if let showLang = showLang {
            showLangUI.text = "Language: \(showLang)"
        }
        view.addSubview(showLangUI)
        
        durationUI = UILabel()
        durationUI.translatesAutoresizingMaskIntoConstraints = false
        if let duration = duration {
            durationUI.text = "Duration: \(duration) min"
        }
        view.addSubview(durationUI)
        
        NSLayoutConstraint.activate([
            imageUI.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 25),
            imageUI.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            showGenresUI.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            showGenresUI.topAnchor.constraint(equalTo: imageUI.bottomAnchor, constant: 20),
            showLangUI.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            showLangUI.topAnchor.constraint(equalTo: showGenresUI.bottomAnchor, constant: 20),
            durationUI.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            durationUI.topAnchor.constraint(equalTo: showLangUI.bottomAnchor, constant: 20)
            
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let showTitle = showTitle {
            title = showTitle
        }
    }

}

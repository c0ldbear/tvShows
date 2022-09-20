//
//  TvShowListViewController+ActivityIndicator.swift
//  tvShows
//
//  Created by teddy on 2022-09-20.
//

import Foundation
import UIKit

extension TvShowListViewController {
    func setupActivityIndicator() {
        view.addSubview(activityIndicator)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityIndicator.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 120)
        ])
    }
}

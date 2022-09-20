//
//  TvShow.swift
//  tvShows
//
//  Created by teddy on 2022-09-20.
//

import Foundation

class TvShow {
    var name: String
    var genres: [String]
    var language: String
    var duration: Int
    var imageMedium: Data
    
    init(name: String, genres: [String], language: String, duration: Int, imageMedium: Data) {
        self.name = name
        self.genres = genres
        self.language = language
        self.duration = duration
        self.imageMedium = imageMedium
    }
}

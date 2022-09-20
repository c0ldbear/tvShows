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
    var imageMedium: Data
    var imageOriginal: Data
    
    init(name: String, genres: [String], imageMedium: Data, imageOriginal: Data) {
        self.name = name
        self.genres = genres
        self.imageMedium = imageMedium
        self.imageOriginal = imageOriginal
    }
}

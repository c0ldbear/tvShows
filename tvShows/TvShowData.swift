//
//  TvShowData.swift
//  tvShows
//
//  Created by teddy on 2022-09-20.
//

import Foundation

class TvShowData: Codable {
    var name: String?
    var language: String?
    var genres: [String]?
    var image: [String: String]?
}

//
//  TvShowData.swift
//  tvShows
//
//  Created by teddy on 2022-09-20.
//

import Foundation

class TvShowData: Codable {
    var name: String?
    var genres: [String]?
    var language: String?
    var runtime: Int?
    var image: [String: String]?
}

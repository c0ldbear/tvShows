//
//  ApiCaller.swift
//  tvShows
//
//  Created by teddy on 2022-09-19.
//

import Foundation

class ApiCaller {
    
    var tvShowUrlString: String = "https://api.tvmaze.com/singlesearch/shows?q=girls"
    
    init() {}
    
    func fetch() -> TvShowData? {
        if let url = URL(string: tvShowUrlString) {
            if let data = try? Data(contentsOf: url) {
                return parse(json: data)
            }
        }
        return nil
    }
    
    func parse(json: Data) -> TvShowData? {
        let decoder = JSONDecoder()
        
        if let parsedJson = try? decoder.decode(TvShowData.self, from: json) {
            return parsedJson
        }
        
        return nil
    }
}

class TvShowData: Codable {
    var name: String?
    var language: String?
}

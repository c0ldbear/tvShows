//
//  ApiCaller.swift
//  tvShows
//
//  Created by teddy on 2022-09-19.
//

import Foundation

class ApiCaller {
    
    var tvShowUrlString: String = "https://api.tvmaze.com/shows"
    // get all shows: https://api.tvmaze.com/shows
    
    init() {}
    
    func fetch() -> [TvShowData]? {
        if let url = URL(string: tvShowUrlString) {
            do {
                let data = try Data(contentsOf: url)
                return parse(json: data)
            } catch {
                print("Fetching error")
                print(error)
            }
        }
        return nil
    }
    
    func parse(json: Data) -> [TvShowData]? {
        let decoder = JSONDecoder()
        
        do {
            let parsedJson = try decoder.decode([TvShowData].self, from: json)
            return parsedJson
        } catch {
            print("Parsing error")
            print(error)
        }
        
        return nil
    }
}

class TvShowData: Codable {
    var name: String?
    var language: String?
}

//
//  ApiCaller.swift
//  tvShows
//
//  Created by teddy on 2022-09-19.
//

import Foundation

class ApiCaller {
    
    var tvShowUrlString: String = "https://api.tvmaze.com/shows" // get all the shows (Not good)
//    var tvShowUrlQuery: String = "https://api.tvmaze.com/search/shows?q=" // Could be nice to use if we only want to fetch when user searches
    
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
    
    func imageFetch(url image: String) -> Data? {
        if let url = URL(string: image) {
            do {
                let data = try Data(contentsOf: url)
                return data
            } catch {
                print("Fetching image error")
                print(error)
            }
        }
        return nil
    }
}

//
//  ApiCaller.swift
//  tvShows
//
//  Created by teddy on 2022-09-19.
//

import Foundation

class ApiCaller {
    
    // Change to: https://api.tvmaze.com/search/shows?q=girls (minus "qirls", this will be added by the search bar)
    // ^ TODO: Need to change Data model to get "show" as an codable so that we then can get right info
    var tvShowUrlString: String = "https://api.tvmaze.com/shows"
    var tvShowUrlQuery: String = "https://api.tvmaze.com/search/shows?q="
    // get all shows: https://api.tvmaze.com/shows
    
    init() {}
    
    func fetch(with urlQuery: String? = nil) -> [TvShowData]? {
        if let url = URL(string: urlQuery ?? tvShowUrlString) {
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

// TODO: MOVE TO OWN FILE
class TvShowData: Codable {
    var name: String?
    var language: String?
    var genres: [String]?
    var image: [String: String]?
}

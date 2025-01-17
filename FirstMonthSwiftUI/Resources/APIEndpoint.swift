//
//  APIEndpoint.swift
//  FirstMonthSwiftUI
//
//  Created by Axel Ganendra on 06/06/24.
//

import Foundation
import Alamofire

struct APIConfig {
    static let baseMovieURL = "https://api.themoviedb.org/3/movie"
    static let baseSearchURL = "https://api.themoviedb.org/3/search/movie?query="
    static let baseImageURL = "https://image.tmdb.org/t/p"
    static let baseTVURL = "https://api.themoviedb.org/3/tv"
    
    static var headers: HTTPHeaders {
        return [
            "accept": "aplication/json",
            "Authorization": Constants.token
        ]
    }
}

enum APIEndpoint {
    case popular(page: Int)
    case upcoming(page: Int)
    case nowPlaying(page: Int)
    case topRated(page: Int)
    case tVAiringToday(page: Int)
    case tVPopular(page: Int)
    case search(query: String, page: Int)
    case image(path: String)
    
    var url: String {
        switch self {
        case .popular(let page):
            return "\(APIConfig.baseMovieURL)/popular?language=en-US&page=\(page)"
        case .upcoming(let page):
            return "\(APIConfig.baseMovieURL)/upcoming?language=en-US&page=\(page)"
        case .nowPlaying(let page):
            return "\(APIConfig.baseMovieURL)/now_playing?language=en-US&page=\(page)"
        case .topRated(let page):
            return "\(APIConfig.baseMovieURL)/top_rated?language=en-US&page=\(page)"
        case .search(let query, let page):
            return "\(APIConfig.baseSearchURL)\(query)&include_adult=false&language=en-US&page=\(page)"
        case .image(let path):
            return "\(APIConfig.baseImageURL)/w500\(path)"
        case .tVAiringToday(page: let page):
            return "\(APIConfig.baseTVURL)/airing_today?language=en-US&page=\(page)"
        case .tVPopular(page: let page):
            return "\(APIConfig.baseTVURL)/popular?language=en-US&page=\(page)"
        }
    }
}

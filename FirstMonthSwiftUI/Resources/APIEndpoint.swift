//
//  APIEndpoint.swift
//  FirstMonthSwiftUI
//
//  Created by Axel Ganendra on 06/06/24.
//

import Foundation
import Alamofire

struct APIConfig {
    static let baseURL = "https://api.themoviedb.org/3/movie"
    static let baseSearchURL = "https://api.themoviedb.org/3/search/movie?query="
    static let baseImageURL = "https://image.tmdb.org/t/p"
    
    static var headers: HTTPHeaders {
        return [
            "accept": "aplication/json",
            "Authorization": Constants.token
        ]
    }
}

enum APIEndpoint {
    case popular(page: Int)
    case nowPlaying(page: Int)
    case topRated(page: Int)
    case search(query: String, page: Int)
    case image(path: String)
    
    var url: String {
        switch self {
        case .popular(let page):
            return "\(APIConfig.baseURL)/popular?language=en-US&page=1\(page)"
        case .nowPlaying(let page):
            return "\(APIConfig.baseURL)/now_playing?language=en-US&page=\(page)"
        case .topRated(let page):
            return "\(APIConfig.baseURL)/top_rated?language=en-US&page=\(page)"
        case .search(let query, let page):
            return "\(APIConfig.baseSearchURL)\(query)&include_adult=false&language=en-US&page=\(page)"
        case .image(let path):
            return "\(APIConfig.baseImageURL)/w500\(path)"
        }
    }
}

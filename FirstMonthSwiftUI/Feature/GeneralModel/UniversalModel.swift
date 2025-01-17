//
//  TVModel.swift
//  FirstMonthSwiftUI
//
//  Created by Axel Ganendra on 12/09/24.
//

import Foundation

//Can be used for Movie and TV
struct UniversalModel: Identifiable, Codable {
    let id: Int
    let adult: Bool
    let overview: String
    let originalLanguage: String
    let popularity: Double
    let voteAverage: Double
    let voteCount: Int
    let posterPath: String?
    let backdropPath: String?
    let genreIds: [Int]
    
    // Movie
    let originalTitle: String?
    let releaseDate: String?
    let title: String?
    let video: Bool?
    
    // TV
    let originalName: String?
    let firstAirDate: String?
    let name: String?
    let originCountry: [String]?
    
    
    let genreMap: [Int: String] = [
        10: "No Genre",
        28: "Action",
        12: "Adventure",
        16: "Animation",
        35: "Comedy",
        80: "Crime",
        99: "Documentary",
        18: "Drama",
        10751 : "Family",
        14: "Fantasy",
        36: "History",
        27: "Horor",
        10402: "Music",
        9648: "Mystery",
        10749: "Romance",
        878: "Science-Fiction",
        10770: "TV Movie",
        53: "Thriller",
        10752: "War",
        37: "Western",
        
        10759: "Action & Adventure",
        10762: "Kids",
        10763: "News",
        10764: "Reality",
        10765: "Sci-Fi & Fantasy",
        10766: "Soap",
        10767: "Talk",
        10768: "War & Politics"
    ]
    
    func convGenre() -> [String] {
        let getName = genreIds.compactMap{ genreMap[$0] }
        return Array(getName.prefix(3))
    }
    
    func rating (num: Double) -> Double {
        return(voteAverage*10).rounded()/10
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case adult
        case overview
        case originalLanguage = "original_language"
        case popularity
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
        case genreIds = "genre_ids"
        case originalTitle = "original_title"
        case releaseDate
        case title
        case video
        case originalName = "original_name"
        case firstAirDate = "first_air_date"
        case name
        case originCountry = "origin_country"
        case genreMap
    }
}

//
//  MovieModelAPI.swift
//  FirstMonthSwiftUI
//
//  Created by Axel Ganendra on 17/05/24.
//

import Foundation

struct MovieAPIResult: Codable {
    let page: Int
    let results: [MovieDataResult]
    let totalPages: Int
    let totalResults: Int
    
    private enum CodingKeys: String, CodingKey {
        case page
        case results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
    
    func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.page, forKey: .page)
        try container.encode(self.results, forKey: .results)
        try container.encode(self.totalPages, forKey: .totalPages)
        try container.encode(self.totalResults, forKey: .totalResults)
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.page = try container.decode(Int.self, forKey: .page)
        self.results = try container.decode([MovieDataResult].self, forKey: .results)
        self.totalPages = try container.decode(Int.self, forKey: .totalPages)
        self.totalResults = try container.decode(Int.self, forKey: .totalResults)
    }
}

struct MovieDataResult: Codable {
    let adult: Bool
    let backdropPath: String?
    let genreIds: [Int]
    let id: Int
    let originalLanguage: String
    let originalTitle: String
    let overview: String
    let popularity: Double
    let posterPath: String?
    let releaseDate: String
    let title: String
    let video: Bool
    let voteAverage: Double
    let voteCount: Int
    
    private enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case genreIds = "genre_ids"
        case id
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview
        case popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title
        case video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
    func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.adult, forKey: .adult)
        try container.encode(self.backdropPath, forKey: .backdropPath)
        try container.encode(self.genreIds, forKey: .genreIds)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.originalLanguage, forKey: .originalLanguage)
        try container.encode(self.originalTitle, forKey: .originalTitle)
        try container.encode(self.overview, forKey: .overview)
        try container.encode(self.popularity, forKey: .popularity)
        try container.encode(self.posterPath, forKey: .posterPath)
        try container.encode(self.releaseDate, forKey: .releaseDate)
        try container.encode(self.title, forKey: .title)
        try container.encode(self.video, forKey: .video)
        try container.encode(self.voteAverage, forKey: .voteAverage)
        try container.encode(self.voteCount, forKey: .voteCount)
    }
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.adult = try container.decode(Bool.self, forKey: .adult)
        self.backdropPath = try container.decodeIfPresent(String.self, forKey: .backdropPath)
        self.genreIds = try container.decode([Int].self, forKey: .genreIds)
        self.id = try container.decode(Int.self, forKey: .id)
        self.originalLanguage = try container.decode(String.self, forKey: .originalLanguage)
        self.originalTitle = try container.decode(String.self, forKey: .originalTitle)
        self.overview = try container.decode(String.self, forKey: .overview)
        self.popularity = try container.decode(Double.self, forKey: .popularity)
        self.posterPath = try container.decodeIfPresent(String.self, forKey: .posterPath)
        self.releaseDate = try container.decode(String.self, forKey: .releaseDate)
        self.title = try container.decode(String.self, forKey: .title)
        self.video = try container.decode(Bool.self, forKey: .video)
        self.voteAverage = try container.decode(Double.self, forKey: .voteAverage)
        self.voteCount = try container.decode(Int.self, forKey: .voteCount)
    }
}

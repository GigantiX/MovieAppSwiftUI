//
//  MovieModel.swift
//  FirstMonthSwiftUI
//
//  Created by Axel Ganendra on 17/05/24.
//

import Foundation

struct MovieModel: Identifiable {
    var id = UUID().uuidString
    
    var movieId: Int
    var movieName: String
    var movieDate: String
    var movieGenre: [Int]
    var movieDesc: String
    var movieScore: Double
    var moviePoster: String
    var movieBackdrops: String
    
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
        37: "Western"
    ]
    
    func convGenre() -> [String] {
        let getName = movieGenre.compactMap{ genreMap[$0] }
        return Array(getName.prefix(3))
    }
    
    func rating (num: Double) -> Double {
        return(movieScore*10).rounded()/10
    }
}



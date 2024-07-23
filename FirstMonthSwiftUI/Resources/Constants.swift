//
//  Constants.swift
//  FirstMonthSwiftUI
//
//  Created by Axel Ganendra on 07/05/24.
//

import Foundation
import Alamofire

class Constants {
    static let decoder = JSONDecoder()
    static let baseURL = "https://api.themoviedb.org/3/movie"
    static let firstPage = "1"
    static let tmdbLogo = "TMDBLogo"
    static let tmdbLogoShort = "TMDBLogoShort"
    
    //Popular Movies
    static let popularLink = "\(baseURL)/popular?language=en-US&page=1"
    static let token = "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI1ZWY4NzhkZTlkY2UwNDQ0Nzc1NWViNDEzMzIyZTRiMyIsInN1YiI6IjY1ZGViN2JjNzYxNDIxMDE2MmQ0YzI0NCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.NpJBzi6fBf_Xer3vFRVGSp8v7KqYwVLKhEleUtCslq4"
    
    //Now Playing
    static let nowPlaying = "\(baseURL)/now_playing?language=en-US&page="
    
    //Top Rated
    static let topRated = "\(baseURL)/top_rated?language=en-US&page="
    
    //Image link
    static let baseImg = "https://image.tmdb.org/t/p"
    static let smallImg = "/w500"
    static let originalImg = "/original"
    static let defaultImg = "/tMefBSflR6PGQLv7WvFPpKLZkyk.jpg"
    
    //HTTP Header
    static var header: HTTPHeaders = [
        "accept": "aplication/json",
        "Authorization": token
    ]
    
    //Search Movies
    static let baseSearch = "https://api.themoviedb.org/3/search/movie?query="
    static let endpointSearch = "&include_adult=false&language=en-US&page="
    
    class MovieResource {
        static let imageMovie = "missionimpossible"
        static let titleMovie = "Mission Impossible - Dead Reckoning"
        static let genreMovie = ["Action","Thriller"]
        static let genreID = [878, 28, 12]
        static let descMovie = "Ethan Hunt and his IMF team embark on their most dangerous mission yet: To track down a terrifying new weapon that threatens all of humanity before it falls into the wrong hands. With control of the future and the world's fate at stake and dark forces from Ethan's past closing in, a deadly race around the globe begins. Confronted by a mysterious, all-powerful enemy, Ethan must consider that nothing can matter more than his mission—not even the lives of those he cares about most."
        static let dummyData = MovieModel(movieId: 823464, movieName: "Godzilla x Kong: The New Empire", movieDate: "2024-03-27", movieGenre: [878, 28, 12], movieDesc: "Following their explosive showdown, Godzilla and Kong must reunite against a colossal undiscovered threat hidden within our world, challenging their very existence – and our own.", movieScore: 7.176, moviePoster: "/tMefBSflR6PGQLv7WvFPpKLZkyk.jpg", movieBackdrops: "/j3Z3XktmWB1VhsS8iXNcrR86PXi.jpg")
    }
}

//
//  MovieAPIService.swift
//  FirstMonthSwiftUI
//
//  Created by Axel Ganendra on 17/05/24.
//

import Foundation
import Alamofire
import RxSwift

class MovieAPIService {
    func fetchMovie(link: String, tokern: String) -> Observable<[MovieModel]> {
        return Observable.create { observer in
            let request = AF.request(link, method: .get, headers: Constants.header).responseDecodable(of: MovieAPIResult.self) { response in
                switch response.result {
                case .success(let decodeMovie):
                    let dataMovie = decodeMovie.results.compactMap { data -> MovieModel? in
                        let moviePoster = data.posterPath ?? "/null"
                        let movieBackdrops = data.backdropPath ?? "/null"
                        return MovieModel(movieId: data.id, movieName: data.title, movieDate: data.releaseDate, movieGenre: data.genreIds, movieDesc: data.overview, movieScore: data.voteAverage, moviePoster: moviePoster, movieBackdrops: movieBackdrops)
                    }
                    observer.onNext(dataMovie)
                    observer.onCompleted()
                case .failure(let error):
                    observer.onError(error)
                }
            }
            return Disposables.create {
                request.cancel()
            }
        }
    }
}

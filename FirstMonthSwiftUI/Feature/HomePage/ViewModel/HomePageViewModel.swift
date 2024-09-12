//
//  HomePageViewModel.swift
//  FirstMonthSwiftUI
//
//  Created by Axel Ganendra on 17/05/24.
//

import Foundation
import RxSwift

class HomePageViewModel: ObservableObject {
    
    @Published var dataMovieNP: [MovieModel] = []
    @Published var dataMovieUpcoming: [MovieModel] = []
    @Published var isLoadingMovieNP = false
    @Published var isLoadingMovieUpcoming = false
    
    private let service = MovieAPIService()
    private let disposeBag = DisposeBag()
    
    func fetchMovieNowPlaying(){
        isLoadingMovieNP = true
        
        service.fetchMovie(link: APIEndpoint.nowPlaying(page: 1).url, tokern: Constants.token).observe(on: MainScheduler.instance).subscribe(
            onNext: { [weak self] movies in
            self?.dataMovieNP = movies
        }, onError: { error in
            print("Error fetch data")
        }, onCompleted: { [weak self] in
            self?.isLoadingMovieNP = false
        }).disposed(by: disposeBag)
    }
    
    func fetchMovieUpcoming(){
        isLoadingMovieUpcoming = true
        
        service.fetchMovie(link: APIEndpoint.upcoming(page: 1).url, tokern: Constants.token).observe(on: MainScheduler.instance).subscribe(
            onNext: { [weak self] movies in
            self?.dataMovieUpcoming = movies
        }, onError: { error in
            print("Error fetch data")
        }, onCompleted: { [weak self] in
            self?.isLoadingMovieUpcoming = false
        }).disposed(by: disposeBag)
    }
}

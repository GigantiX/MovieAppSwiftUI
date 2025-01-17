//
//  HomePageViewModel.swift
//  FirstMonthSwiftUI
//
//  Created by Axel Ganendra on 17/05/24.
//

import Foundation
import RxSwift

class HomePageViewModel: ObservableObject {
    
    @Published var dataMovieNP: [UniversalModel] = []
    @Published var dataTV: [UniversalModel] = []
    @Published var isLoadingMovieNP = false
    @Published var isLoadingMovieUpcoming = false
    @Published var isLoading = false
    
    private let service = MovieAPIService()
    private let universalService = UniversalAPIService()
    private let disposeBag = DisposeBag()
    
    func fetchMovieNowPlaying(){
        isLoadingMovieNP = true
        
        universalService.fetchItem(link: APIEndpoint.nowPlaying(page: 1).url, token: Constants.token).observe(on: MainScheduler.instance).subscribe(
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
        
        universalService.fetchItem(link: APIEndpoint.tVPopular(page: 1).url, token: Constants.token).observe(on: MainScheduler.instance).subscribe(
            onNext: { [weak self] item in
            self?.dataTV = item
        }, onError: { error in
            print("Error fetch data")
        }, onCompleted: { [weak self] in
            self?.isLoadingMovieUpcoming = false
        }).disposed(by: disposeBag)
    }
}

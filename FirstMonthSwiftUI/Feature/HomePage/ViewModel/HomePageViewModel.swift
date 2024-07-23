//
//  HomePageViewModel.swift
//  FirstMonthSwiftUI
//
//  Created by Axel Ganendra on 17/05/24.
//

import Foundation
import RxSwift

class HomePageViewModel: ObservableObject {
    
    @Published var data: [MovieModel] = []
    @Published var isLoading = false
    
    private let service = MovieAPIService()
    private let disposeBag = DisposeBag()
    
    func fetchPopularData(){
        isLoading = true
        
        service.fetchMovie(link: "\(Constants.nowPlaying)\(Constants.firstPage)", tokern: Constants.token).observe(on: MainScheduler.instance).subscribe(
            onNext: { [weak self] movies in
            self?.data = movies
        }, onError: { error in
            print("Error fetch data")
        }, onCompleted: { [weak self] in
            self?.isLoading = false
        }).disposed(by: disposeBag)
    }
}

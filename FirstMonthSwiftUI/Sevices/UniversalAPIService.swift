//
//  TVAPIService.swift
//  FirstMonthSwiftUI
//
//  Created by Axel Ganendra on 13/09/24.
//

import Foundation
import RxSwift
import Alamofire

class UniversalAPIService {
    func fetchItem(link: String, token: String) -> Observable<[UniversalModel]> {
        return Observable.create { observer in
            let request = AF.request(link, method: .get, headers: Constants.header).responseDecodable(of: UniversalModelAPI.self) {
                response in
                switch response.result {
                case .success(let decodeTV):
                    observer.onNext(decodeTV.results)
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

//
//  MovieDetail.swift
//  FirstMonthSwiftUI
//
//  Created by Axel Ganendra on 22/05/24.
//

import SwiftUI
import Kingfisher
import Shimmer

struct MovieDetail: View {
    @State var isLoading: Bool = true
    @State var textLoading = "Loading..."
    
    @State var movieData: UniversalModel
    
    var body: some View {
        VStack(alignment: .leading) {
            ZStack(alignment: .top) {
                KFImage(URL(string: APIEndpoint.image(path: movieData.backdropPath ?? "").url))
                    .onSuccess {_ in
                        isLoading = false
                    }
                    .onFailure {_ in
                        textLoading = "No internet connection"
                    }
                    .resizable()
                    .scaledToFill()
                    .blur(radius: 6.0)
                    .frame(height: 400)
                    .overlay(
                        Color.black.opacity(0.3)
                    )
                
                VStack(alignment: .center, spacing: 0) {
                    if isLoading {
                        Text(textLoading)
                            .foregroundStyle(.white)
                            .fontWeight(.semibold)
                            .padding(.horizontal, 10)
                            .padding(.bottom, 20)
                            .padding(.top, 50)
                            .font(.title)
                            .shimmering()
                    } else {
                        Text(movieData.originalName ?? movieData.originalTitle ?? "Unknown Movie")
                            .foregroundStyle(.white)
                            .fontWeight(.semibold)
                            .padding(.horizontal, 10)
                            .padding(.bottom, 20)
                            .padding(.top, 20)
                            .font(.title2)
                        
                        Text(movieData.overview)
                            .foregroundStyle(.white)
                            .padding(.horizontal, 180)
                    }
                }
            }
            .frame(height: 500)
        }.background(.black)
        Color.black.ignoresSafeArea()
    }
}

//#Preview {
//    MovieDetail()
//}

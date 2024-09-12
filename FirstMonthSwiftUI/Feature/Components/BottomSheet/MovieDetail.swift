//
//  MovieDetail.swift
//  FirstMonthSwiftUI
//
//  Created by Axel Ganendra on 22/05/24.
//

import SwiftUI
import Kingfisher
import SkeletonUI

struct MovieDetail: View {
    @State var isLoading: Bool = true
    
    var movieData: MovieModel = Constants.MovieResource.dummyData
    
    var body: some View {
        VStack(alignment: .leading) {
            ZStack(alignment: .top) {
                KFImage(URL(string: APIEndpoint.image(path: movieData.movieBackdrops).url))
                    .onSuccess {_ in 
                        isLoading = false
                    }
                    .onFailure {_ in
                        isLoading = false
                    }
                    .resizable()
                    .scaledToFill()
                    .blur(radius: 6.0)
                    .frame(height: 400)
                    .overlay(
                        Color.black.opacity(0.3)
                    )
                
                VStack(alignment: .center, spacing: 0) {
                    Text(movieData.movieName)
                        .foregroundStyle(.white)
                        .fontWeight(.semibold)
                        .padding(.horizontal, 10)
                        .padding(.bottom, 20)
                        .padding(.top, 20)
                        .font(.title2)
                        .skeleton(with: isLoading)
                        .animation(.bouncy)
                    
                    
                    Text(movieData.movieDesc)
                        .foregroundStyle(.white)
                        .padding(.horizontal, 180)
                        .skeleton(with: isLoading)
                        .animation(.bouncy)
                }
            }
            .frame(height: 500)
        }.background(.black)
        Color.black.ignoresSafeArea()
    }
}

#Preview {
    MovieDetail()
}

//
//  MovieDetail.swift
//  FirstMonthSwiftUI
//
//  Created by Axel Ganendra on 22/05/24.
//

import SwiftUI
import Kingfisher

struct MovieDetail: View {
    private var movieDummy: MovieModel = Constants.MovieResource.dummyData
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                KFImage(URL(string: APIEndpoint.image(path: movieDummy.movieBackdrops).url))
                    .resizable()
                    .scaledToFill()
                    .blur(radius: 1.0)
                    
                Text(movieDummy.movieName)
                    .foregroundStyle(.white)
                    .fontWeight(.semibold)
            }
            .frame(height: 300)
            Text(movieDummy.movieDesc)
                .padding(.horizontal, 10)
                .padding(.vertical, 10)
        }
    }
}

#Preview {
    MovieDetail()
}

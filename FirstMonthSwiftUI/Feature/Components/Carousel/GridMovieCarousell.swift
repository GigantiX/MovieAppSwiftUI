//
//  GridMovieCarousell.swift
//  FirstMonthSwiftUI
//
//  Created by Axel Ganendra on 09/10/24.
//

import SwiftUI

struct GridMovieCarousell: View {
    @State var movies: [UniversalModel] = []
    
    let itemSet: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        LazyVGrid(columns: itemSet, spacing: 5) {
            ForEach(movies) { movie in
                SmallMovieBanner(data: movie)
                    .frame(width: 250, height: 350)
            }
        }
        .padding(.horizontal, 5)
    }
}

#Preview {
    GridMovieCarousell()
}

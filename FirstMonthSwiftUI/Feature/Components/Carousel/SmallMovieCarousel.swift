//
//  SmallMovieCarousel.swift
//  FirstMonthSwiftUI
//
//  Created by Axel Ganendra on 06/09/24.
//

import SwiftUI

struct SmallMovieCarousel: View {
    @State var data: [UniversalModel] = []
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack (spacing: 10) {
                ForEach(data.indices.prefix(10), id: \.self) { index in
                    SmallMovieBanner(data: data[index])
                        .frame(width: 120, height: 180)
                        .skeleton(isVisible: true)
                }
            }.frame(height: 240)
                .padding(.leading, 10)
        }
    }
}

#Preview {
    SmallMovieCarousel().background(Color.black)
}

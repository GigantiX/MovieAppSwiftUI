//
//  MovieBanner.swift
//  FirstMonthSwiftUI
//
//  Created by Axel Ganendra on 07/05/24.
//

import SwiftUI
import Kingfisher

struct MovieBanner: View {
    var movieDummy: MovieModel = Constants.MovieResource.dummyData
    var onPlayPress: (() -> Void)? = nil
    var onAddListPress: (() -> Void)? = nil
    var isMovie = true
    
    @State var bottomSheet = false
    @State var isShow = false
    
    func getStatus() -> String {
        return isMovie ? "Movie" : "Series"
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            KFImage(URL(string: "\(Constants.baseImg)\(Constants.smallImg)\(movieDummy.moviePoster)"))
                .resizable()
                .scaledToFill()
            VStack(spacing: 17) {
                VStack {
                    HStack {
                        Image(Constants.tmdbLogoShort).resizable().frame(width: 100, height: 15)
                        Text(getStatus())
                            .kerning(3)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundStyle(.colorWhiteGrey)
                    }
                    Text(movieDummy.movieName)
                        .font(.system(size: 25, weight: .medium, design: .serif))
                        .multilineTextAlignment(.center)
                        .foregroundStyle(.white)
                        .padding(.horizontal, 10)
                }
                HStack(spacing: 8) {
                    ForEach(movieDummy.convGenre(), id: \.self) { genre in
                        Text(genre)
                            .font(.system(size: 14))
                            .foregroundStyle(.colorWhiteGrey)
                        if genre != movieDummy.convGenre().last {
                            Circle()
                                .frame(width: 4, height: 4)
                                .foregroundStyle(.colorWhiteGrey)
                        }
                    }
                }
                HStack(spacing: 15) {
                    HStack {
                        Image(systemName: "play.fill")
                            .foregroundStyle(.colorBlueBlack)
                        Text("Play")
                            .foregroundStyle(.colorBlueBlack)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 8)
                    .background(Color.colorWhiteGrey)
                    .clipShape(RoundedRectangle(cornerRadius: 5))
                    .onTapGesture {
                        onPlayPress?()
                        bottomSheet.toggle()
                        isShow.toggle()
                    }
                    HStack {
                        Image(systemName: "plus")
                            .foregroundStyle(.colorWhiteGrey)
                        Text("Add list")
                            .foregroundStyle(.colorWhiteGrey)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 8)
                    .background(Color.colorBlueBlack)
                    .clipShape(RoundedRectangle(cornerRadius: 5))
                    .onTapGesture {
                        onAddListPress?()
                        bottomSheet.toggle()
                        isShow.toggle()
                    }
                }
                .padding(.horizontal, 20)
                .font(.callout)
                .fontWeight(.medium)
            }
            .sheet(isPresented: $isShow, content: {
                MovieDetail(movieData: movieDummy)
                    .presentationDetents([.height(400), .height(600)])
                    .background(Color.black)
            })
            .padding(.vertical, 20)
            .background(
                LinearGradient(
                    colors: [
                        .black.opacity(0.01),
                        .black.opacity(0.6),
                        .black.opacity(0.8)
                    ],
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
        }
        .aspectRatio(0.8, contentMode: .fit)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .onTapGesture {
            isShow.toggle()
        }
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        MovieBanner()
            .padding(40)
    }
    
}

//
//  ContentView.swift
//  FirstMonthSwiftUI
//
//  Created by Axel Ganendra on 23/04/24.
//

import SwiftUI
import SwiftfulUI
import Shimmer

struct HomePage: View {
    
    @State private var filters = FilterModel.filterData
    @State private var selectedFilter: FilterModel? = nil
    @State private var headerSize: CGSize  = .zero
    @State private var asd = ""
    @State private var isload = true
    @State var isLoading: Bool = false
    @State var currentIndex : Int = 0
    
    @EnvironmentObject var router: Router
    
    @StateObject private var viewModel = HomePageViewModel()
    
    var body: some View {
        ZStack(alignment: .top) {
            Color.black.ignoresSafeArea()
            
            ScrollView(.vertical) {
                VStack(spacing: 8) {
                    Rectangle()
                        .opacity(0)
                        .frame(height: headerSize.height)
                    
                    VStack {
                        
                        if viewModel.isLoadingMovieNP {
                            RoundedRectangle(cornerRadius: 15)
                                .fill(.white)
                                .frame(width: 280, height: 470)
                                .shimmering()
                        } else {
                            MovieCarousel(data: viewModel.dataMovieNP)
                        }
                    }.onAppear {
                        viewModel.fetchMovieNowPlaying()
                    }
                    .padding(.top, 30)
                    
                    HStack(alignment: .top) {
                        Spacer().frame(width: 20)
                        Text("Upcoming")
                            .foregroundStyle(.white)
                            .bold()
                            .padding(.top, 20)
                            .font(.title2)
                            .skeleton(isVisible: viewModel.isLoading)
                        
                        Spacer()
                    }
                    
                    VStack {
                        if viewModel.isLoadingMovieUpcoming {
                            HStack {
                                ForEach(0..<3) { _ in
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(.white)
                                        .frame(width: 120, height: 180)
                                        .shimmering()
                                }
                            }
                        } else {
                            SmallMovieCarousel(data: viewModel.dataTV)
                        }
                    }.onAppear {
                        viewModel.fetchMovieUpcoming()
                    }
                    .padding(.vertical, 10)
                    
                    HStack(alignment: .top) {
                        Text("Popular")
                            .foregroundStyle(.white)
                            .bold()
                            .padding(.horizontal, 10)
                            .padding(.top, 20)
                            .font(.title2)
                        
                        Spacer()
                    }
                    if viewModel.isLoadingMovieUpcoming {
                        HStack {
                            ForEach(0..<2) { _ in
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(.white)
                                    .frame(width: 120, height: 180)
                                    .shimmering()
                            }
                        }
                    } else {
                        GridMovieCarousell(movies: viewModel.dataMovieNP)
                    }
                }
            }
            
            VStack(spacing: 0) {
                header
                    .padding(.horizontal, 16)
                    .padding(.bottom, 10)
                FilterBar(
                    filters: filters,
                    selectedFilter: selectedFilter,
                    onFilterPress: { newFilter in
                        selectedFilter = newFilter
                    },
                    onClosePress: {
                        selectedFilter = nil
                    }
                )
                .padding(.vertical, 5)
            }
            .background(Color.black)
            .readingFrame { frame in
                headerSize = frame.size
            }
        }
        .foregroundStyle(.white)
    }
    
    private var header: some View {
        HStack {
            Image(Constants.tmdbLogo).resizable().scaledToFit() .frame(maxWidth: 50, alignment: .leading).skeleton(isVisible: viewModel.isLoading)
            Spacer()
            HStack(spacing: 15) {
                Button(action: {
                    viewModel.isLoading.toggle()
                }) {
                    Image(systemName: "person.circle").resizable().frame(width: 30, height: 30)
                }
            }
        }
    }
}

#Preview {
    HomePage()
}



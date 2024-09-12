//
//  ContentView.swift
//  FirstMonthSwiftUI
//
//  Created by Axel Ganendra on 23/04/24.
//

import SwiftUI
import SwiftfulUI
import SkeletonUI

struct HomePage: View {
    
    @State private var filters = FilterModel.filterData
    @State private var selectedFilter: FilterModel? = nil
    @State private var headerSize: CGSize  = .zero
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
                            ProgressView()
                        } else {
                            MovieCarousel(data: viewModel.dataMovieNP)
                        }
                    }.onAppear {
                        viewModel.fetchMovieNowPlaying()
                    }
                    .padding(.top, 30)
                    
                    HStack(alignment: .top) {
                        Text("Upcoming Movies")
                            .foregroundStyle(.white)
                            .bold()
                            .padding(.horizontal, 10)
                            .font(.title2)
                        
                        Spacer()
                    }
                    
                    VStack {
                        if viewModel.isLoadingMovieUpcoming {
                            ProgressView()
                        } else {
                            SmallMovieCarousel(data: viewModel.dataMovieUpcoming)
                        }
                    }.onAppear {
                        viewModel.fetchMovieUpcoming()
                    }
                    .padding(.vertical, 10)
                    
                    
                    ForEach(0..<4) { num in
                        Rectangle()
                            .fill(.red)
                            .frame(height: 200)
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
            Image(Constants.tmdbLogo).resizable().scaledToFit() .frame(maxWidth: 50, alignment: .leading)
            Spacer()
            HStack(spacing: 15) {
                Button(action: {
                    router.navigateTo(to: .searchPage)
                }) {
                    Image(systemName: "magnifyingglass").resizable().frame(width: 25, height: 25)
                }.buttonStyle(PlainButtonStyle())
                Button(action: {
                    
                }) {
                    Image(systemName: "person.circle").resizable().frame(width: 30, height: 30)
                }
            }
        }
    }
}

//#Preview {
//    HomePage()
//}



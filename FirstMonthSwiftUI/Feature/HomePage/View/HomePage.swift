//
//  ContentView.swift
//  FirstMonthSwiftUI
//
//  Created by Axel Ganendra on 23/04/24.
//

import SwiftUI
import SwiftfulUI

struct HomePage: View {
    
    @State private var filters = FilterModel.filterData
    @State private var selectedFilter: FilterModel? = nil
    @State private var headerSize: CGSize  = .zero
    @State var currentIndex : Int = 0
    
    
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
                        if viewModel.isLoading {
                            ProgressView()
                        } else {
                            MovieCarousel(data: viewModel.data)
                        }
                    }.onAppear {
                        viewModel.fetchPopularData()
                    }
                    .padding(.vertical, 30)
                    
                    ForEach(0..<10) { num in
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
                Image(systemName: "magnifyingglass").resizable().frame(width: 25, height: 25)
                Image(systemName: "person.circle").resizable().frame(width: 30, height: 30)
            }
        }
    }
}

#Preview {
    HomePage()
}



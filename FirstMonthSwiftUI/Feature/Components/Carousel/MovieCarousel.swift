//
//  MovieCarousel.swift
//  FirstMonthSwiftUI
//
//  Created by Axel Ganendra on 16/05/24.
//

import SwiftUI

struct MovieCarousel: View {
    @State var data: [MovieModel] = []
    
    var onClick: (() -> Void)? = nil
    
    @State private var currentIndex: Int = 0
    @GestureState private var dragOffset: CGFloat = 0
    
    var body: some View {
        VStack {
            ZStack {
                ForEach(data.indices.prefix(10), id: \.self) { index in
                    bannerView(for: index)
                }
            }
            .gesture(DragGesture()
                .updating($dragOffset) { value, state, _ in
                    state = value.translation.width
                }
                .onEnded { value in
                    let threshold: CGFloat = 50
                    let dragDistance = value.translation.width
                    var newIndex = currentIndex
                    
                    if dragDistance > threshold {
                        newIndex = max(0, currentIndex - 1)
                    } else if dragDistance < -threshold {
                        newIndex = min(data.indices.prefix(10).count - 1, currentIndex + 1)
                    }
                    withAnimation(.spring()) {
                        currentIndex = newIndex
                    }
                })
        }
    }
    
    @ViewBuilder
    private func bannerView(for index: Int) -> some View {
        MovieBanner(movieDummy: data[index])
            .frame(width: 280, height: 470)
            .opacity(currentIndex == index ? 1.0 : 0.5)
            .scaleEffect(currentIndex == index ? 1.2 : 0.8)
            .offset(x: CGFloat(index - currentIndex) * 300 + dragOffset)
            .animation(.spring(), value: dragOffset)
    }
}

#Preview {
    MovieCarousel()
}

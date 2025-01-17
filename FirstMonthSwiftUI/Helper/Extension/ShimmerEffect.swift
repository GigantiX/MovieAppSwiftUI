//
//  ShimmerEffect.swift
//  FirstMonthSwiftUI
//
//  Created by Axel Ganendra on 18/12/24.
//

import SwiftUI

extension View {
    @ViewBuilder
    func skeleton(
        isVisible: Bool,
        opacity: Double = 0.5,
        cornerRadius: CGFloat = 8
    ) -> some View {
        if isVisible {
            self.modifier(ShimmerOverlayModifier(
                opacity: opacity,
                cornerRadius: cornerRadius
            ))
        } else {
            self
        }
    }
}


struct ShimmerOverlayModifier: ViewModifier {
    let opacity: Double
    let cornerRadius: CGFloat
    
    var colorShimmer = [
        Color(uiColor: UIColor.systemGray5),
        Color(uiColor: UIColor.white),
        Color(uiColor: UIColor.systemGray5)
    ]
    
    @State private var moveTo: CGFloat = -1.3
    
    func body(content: Content) -> some View {
        content
            .hidden()
            .overlay(
                Rectangle()
                    .fill(.gray.opacity(opacity))
                    .cornerRadius(cornerRadius)
                    .overlay(
                        Rectangle()
                            .cornerRadius(cornerRadius)
                            .mask(
                                GeometryReader { geometry in
                                    let size = geometry.size
                                    let sizeWidth = min(size.width / 2, 60.0)
                                    
                                    Rectangle()
                                    //Gradient Loading
                                        .fill(
                                            .linearGradient(colors: colorShimmer, startPoint: .leading, endPoint: .trailing)
                                        )
                                        .blur(radius: 25)
                                        .frame(width: sizeWidth , height: size.height + 20)
                                        .offset(x: size.width * moveTo)
                                        .onAppear {
                                            moveTo = 2.0
                                        }.animation(.easeInOut(duration: 1.5).repeatForever(autoreverses: false), value: moveTo)
                                }
                            )
                    )
            )
    }
}

#Preview {
    HomePage()
}

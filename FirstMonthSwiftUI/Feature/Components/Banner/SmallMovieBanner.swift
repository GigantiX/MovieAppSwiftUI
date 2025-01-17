//
//  SmallMovieBanner.swift
//  FirstMonthSwiftUI
//
//  Created by Axel Ganendra on 06/09/24.
//

import SwiftUI
import Kingfisher

struct SmallMovieBanner: View {
    @State var data: UniversalModel
    
    var body: some View {
        VStack() {
            KFImage(URL(string: "\(Constants.baseImg)\(Constants.smallImg)\(data.posterPath ?? "")"))
                .resizable()
                .scaledToFill()
                .frame(width: 120, height: 180)
                .clipShape(RoundedRectangle(cornerSize: CGSize(width: 7, height: 7)))
                .shadow(color: Color.black.opacity(0.4), radius: 5, x: 0, y: 0)
            
            Text(data.originalName ?? data.originalTitle ?? "")
                .lineLimit(2, reservesSpace: true)
                .foregroundStyle(Color.white)
        }
        .frame(width: 120, height: 230)
    }
}

//#Preview {
//    SmallMovieBanner().background(Color.black)
//}

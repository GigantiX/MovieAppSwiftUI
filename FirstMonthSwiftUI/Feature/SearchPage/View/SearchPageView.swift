//
//  SearchPageVIew.swift
//  FirstMonthSwiftUI
//
//  Created by Axel Ganendra on 10/09/24.
//

import SwiftUI

struct SearchPageView: View {
    @State private var textSearch: String = ""
    
    @EnvironmentObject var router: Router
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .center) {
                Button(action: {
                    router.pop()
                }) {
                    Image(systemName: "chevron.left")
                        .resizable()
                        .frame(width: 20, height: 30)
                        .foregroundStyle(.white)
                }
                HStack {
                    TextField("", text: $textSearch, prompt: Text("Enter a movie..").foregroundStyle(.white))
                        .padding(.leading, 10)
                        .foregroundStyle(.white)
                    Button(action: {
                        
                    }) {
                        Image(systemName: "magnifyingglass").resizable().frame(width: 25, height: 25)
                    }
                    .foregroundStyle(.white)
                    .padding(.trailing, 12)
                }
                .frame(height: 40)
                .frame(maxWidth: .infinity)
                .background(Color.gray.opacity(0.5))
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .padding(.leading, 5)
            }
            .frame(height: 48)
            .padding(15)
            Spacer()
        }.navigationBarBackButtonHidden()
    }
}

#Preview {
    SearchPageView().background(Color.black)
}

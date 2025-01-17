//
//  MainTabView.swift
//  FirstMonthSwiftUI
//
//  Created by Axel Ganendra on 17/09/24.
//

import Foundation
import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            HomePage().tabItem {
                Image(systemName: "house")
                Text("Home")
            }
            SearchPageView().tabItem {
                Image(systemName: "magnifyingglass")
                Text("Search")
            }
        }
        .tint(.red)
    }
}

#Preview {
    MainTabView()
}

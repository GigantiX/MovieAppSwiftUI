//
//  FirstMonthSwiftUIApp.swift
//  FirstMonthSwiftUI
//
//  Created by Axel Ganendra on 23/04/24.
//

import SwiftUI

@main
struct FirstMonthSwiftUIApp: App {
    @StateObject var router = Router()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $router.path) {
                MainTabView().navigationDestination(for: Router.Destination.self) { destination in
                    switch destination {
                    case .searchPage:
                        SearchPageView()
                    }
                }
            }.environmentObject(router)
        }
    }
}

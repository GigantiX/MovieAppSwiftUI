//
//  TabItems.swift
//  FirstMonthSwiftUI
//
//  Created by Axel Ganendra on 17/09/24.
//

import Foundation

enum TabItems: Int, CaseIterable {
    case home = 0
    case search
    case favorite
    
    var title: String {
        switch self {
        case .home:
            return "Home"
        case .search:
            return "Search"
        case .favorite:
            return "Favorite"
        }
    }
    
    var iconName: String {
        switch self {
        case .home:
            return ""
        case .search:
            return ""
        case .favorite:
            return ""
        }
    }
}

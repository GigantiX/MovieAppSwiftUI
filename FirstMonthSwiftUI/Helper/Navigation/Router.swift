//
//  NavigationManager.swift
//  FirstMonthSwiftUI
//
//  Created by Axel Ganendra on 10/09/24.
//

import SwiftUI

class Router: ObservableObject {
    
    public enum Destination: Codable, Hashable {
        case searchPage
    }
    
    @Published var path = NavigationPath()
    
    func navigateTo(to location: Destination) {
        path.append(location)
    }
    
    func navigateToRoot() {
        path.removeLast(path.count)
    }
    
    func pop() {
        path.removeLast()
    }
}

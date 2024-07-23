//
//  FilterModel.swift
//  FirstMonthSwiftUI
//
//  Created by Axel Ganendra on 06/05/24.
//

import Foundation

struct FilterModel: Hashable, Equatable {
    let title: String
    let isDropdown: Bool
    
    static var filterData: [FilterModel] {
        [
            FilterModel(title: "TV Series", isDropdown: false),
            FilterModel(title: "Movie", isDropdown: false)
        ]
    }
}

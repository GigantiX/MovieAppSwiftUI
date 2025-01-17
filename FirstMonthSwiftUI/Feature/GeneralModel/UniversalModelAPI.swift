//
//  TVModelAPI.swift
//  FirstMonthSwiftUI
//
//  Created by Axel Ganendra on 12/09/24.
//

import Foundation

struct UniversalModelAPI: Codable {
    let page: Int
    let results: [UniversalModel]
    let totalPages: Int
    let totalResults: Int
    
    private enum CodingKeys: String, CodingKey {
        case page
        case results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
    
}

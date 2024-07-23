//
//  FilterComponent.swift
//  FirstMonthSwiftUI
//
//  Created by Axel Ganendra on 06/05/24.
//

import SwiftUI

struct FilterComponent: View {
    var title = "Categories"
    var isDropdown = true
    var isSelected = false
    
    var body: some View {
        HStack(spacing: 4) {
            Text(title)
            if isDropdown {
                Image(systemName: "chevron.down")
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 8)
        .background(
            ZStack {
                if isSelected {
                    Capsule(style: .circular).fill(.colorRedDark)
                }
                Capsule(style: .circular).stroke(lineWidth: 2)
            }
        )
        .foregroundStyle(.colorWhiteGrey)
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        VStack {
            FilterComponent()
            FilterComponent(isSelected: true)
            FilterComponent(isDropdown: false)
        }
    }
}

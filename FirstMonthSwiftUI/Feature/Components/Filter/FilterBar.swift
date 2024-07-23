//
//  FilterBar.swift
//  FirstMonthSwiftUI
//
//  Created by Axel Ganendra on 06/05/24.
//

import SwiftUI

struct FilterBar: View {
    var filters: [FilterModel] = FilterModel.filterData
    var selectedFilter: FilterModel? = nil
    var onFilterPress: ((FilterModel) -> Void)? = nil
    var onClosePress: (() -> Void)? = nil
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                if selectedFilter != nil {
                    Image(systemName: "xmark")
                        .padding(8)
                        .background(
                            Circle().stroke(lineWidth: 1)
                        )
                        .foregroundStyle(.colorWhiteGrey)
                        .background(Color.black.opacity(0.01))
                        .onTapGesture {
                            onClosePress?()
                        }
                        .transition(AnyTransition.move(edge: .leading))
                }
                ForEach(filters, id: \.self) { filter in
                    if selectedFilter == nil || selectedFilter == filter {
                        FilterComponent(title: filter.title, isDropdown: filter.isDropdown, isSelected: selectedFilter == filter
                        )
                        .background(Color.black.opacity(0.01))
                        .onTapGesture {
                            onFilterPress?(filter)
                        }
                        .padding(.leading, ((selectedFilter == nil) && filter == filters.first) ? 16 : 0)
                    }
                }
            }
            .padding(.vertical, 5)
        }
        .scrollIndicators(.hidden)
        .animation(.bouncy, value: selectedFilter)
    }
}

fileprivate struct FilterBarPreview: View {
    
    @State private var filters = FilterModel.filterData
    @State private var selectedFilter: FilterModel? = nil
    
    var body: some View {
        FilterBar(
            filters: filters,
            selectedFilter: selectedFilter,
            onFilterPress: { newFilter in
                selectedFilter = newFilter
            },
            onClosePress: {
                selectedFilter = nil
            }
        )
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        FilterBarPreview()
    }
}

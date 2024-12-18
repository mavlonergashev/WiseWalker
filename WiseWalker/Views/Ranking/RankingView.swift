//
//  RankingView.swift
//  WiseWalker
//
//  Created by Mavlon Ergashev on 11/12/24.
//

import SwiftUI

struct RankingView: View {
    
    private let viewModel: RankingViewModel
    
    init(viewModel: RankingViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationStack {
            List {
                Section("Top today") {
                    ForEach(
                        Array(viewModel.topToday.enumerated()),
                        id: \.element.id
                    ) { (index, item) in
                        RankingItemView(index: index, item: item)
                    }
                }
                Section("Top week") {
                    ForEach(
                        Array(viewModel.topWeek.enumerated()),
                        id: \.element.id
                    ) { (index, item) in
                        RankingItemView(index: index, item: item)
                    }
                }
            }
            .navigationTitle("Ranking")
        }
    }
}

#Preview {
    RankingView(viewModel: RankingViewModel())
}

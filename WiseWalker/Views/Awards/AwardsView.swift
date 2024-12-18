//
//  AwardsView.swift
//  WiseWalker
//
//  Created by Mavlon Ergashev on 11/12/24.
//

import SwiftUI

struct AwardsView: View {
    
    private let viewModel: AwardsViewModel
    
    init(viewModel: AwardsViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationStack {
            List {
                Section("Explore today") {
                    QuoteItemView(
                        quote: viewModel.todaysQuote,
                        isLocked: !viewModel.achievedTodaysPrize,
                        needs: viewModel.needs
                    )
                    .listRowSeparator(.hidden)
                }
                Section("All unlocked quotes") {
                    ForEach(viewModel.unlockedQuotes) { item in
                        QuoteItemView(quote: item)
                            .listRowSeparator(.hidden)
                    }
                }
            }
            .listStyle(.plain)
            .navigationTitle("Awards")
        }
    }
}

#Preview {
    AwardsView(viewModel: AwardsViewModel())
}

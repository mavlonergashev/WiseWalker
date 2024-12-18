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
    
    var todaysQuote: some View {
        QuoteItemView(
            quote: viewModel.todaysQuote,
            isLocked: !viewModel.achievedTodaysPrize,
            needs: viewModel.needs
        )
    }
    
    var body: some View {
        NavigationStack {
            List {
                Section("Explore today") {
                    if viewModel.achievedTodaysPrize {
                        NavigationLink(destination: AwardDetailView(quote: viewModel.todaysQuote)) {
                            todaysQuote
                        }
                        .listRowSeparator(.hidden)
                    } else {
                        todaysQuote
                        .listRowSeparator(.hidden)
                    }
                }
                Section("All unlocked quotes") {
                    ForEach(viewModel.unlockedQuotes) { item in
                        NavigationLink {
                            AwardDetailView(quote: item)
                        } label: {
                            QuoteItemView(quote: item)
                        }
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

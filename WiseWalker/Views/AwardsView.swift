//
//  AwardsView.swift
//  WiseWalker
//
//  Created by Mavlon Ergashev on 11/12/24.
//

import SwiftUI

struct AwardsView: View {
    
    @State private var quotes: [QuoteItemModel] = [
        QuoteItemModel(
            title: "Our time is limited, so don't waste it living someone else's life",
            author: "Steve Jobs",
            description: "aa"
        ),
        QuoteItemModel(
            title: "Your time is limited, so don't waste it living someone else's life",
            author: "Steve Jobs",
            description: "aa"
        )
    ]
    
    var body: some View {
        NavigationStack {
            List {
                Section("Today you unlocked") {
                    QuoteItemView(
                        quote: QuoteItemModel(
                            title: "You may say I'm a dreamer, but I'm not the only one",
                            author: "John Lennon",
                            description: "aa"
                        )
                    )
                    .listRowSeparator(.hidden)
                }
                Section("All quotes") {
                    ForEach(quotes, id: \.title) { item in
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
    AwardsView()
}

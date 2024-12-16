//
//  QuoteItemView.swift
//  WiseWalker
//
//  Created by Mavlon Ergashev on 16/12/24.
//

import SwiftUI

struct QuoteItemModel {
    let title: String
    let author: String
    let description: String
}

struct QuoteItemView: View {
    
    private let quote: QuoteItemModel
    
    init(quote: QuoteItemModel) {
        self.quote = quote
    }
    
    var body: some View {
        ZStack {
            Color.white
                .clipShape(.rect(cornerRadius: 12))
            VStack(alignment: .leading, spacing: 16) {
                Text(quote.title)
                    .foregroundStyle(.black)
                    .font(.callout)
                    .fixedSize(horizontal: false, vertical: true)
                Text(quote.author)
                    .foregroundStyle(.indigo)
                    .font(.caption)
                    .bold()
            }
            .padding()
        }
        .fixedSize(horizontal: false, vertical: true)
        .shadow(
            color: .indigo.opacity(0.2),
            radius: 5,
            x: 0,
            y: 2
        )
        .padding(-4)
    }
}

#Preview {
    QuoteItemView(
        quote: QuoteItemModel(
            title: "Your time is limited, so don't waste it living someone else's life.",
            author: "Steve Jobs",
            description: "aa"
        )
    )
}



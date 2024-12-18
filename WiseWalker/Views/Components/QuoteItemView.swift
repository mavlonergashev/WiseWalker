//
//  QuoteItemView.swift
//  WiseWalker
//
//  Created by Mavlon Ergashev on 16/12/24.
//

import SwiftUI

struct QuoteItemView: View {
    
    private let quote: QuoteItemModel
    private let isLocked: Bool
    private let needs: Int
    
    init(quote: QuoteItemModel, isLocked: Bool = false, needs: Int = 0) {
        self.quote = quote
        self.isLocked = isLocked
        self.needs = needs
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
            
            if isLocked {
                LockerView(needs: needs)
            }
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



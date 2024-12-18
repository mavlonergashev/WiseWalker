//
//  AwardDetailView.swift
//  WiseWalker
//
//  Created by Mavlon Ergashev on 18/12/24.
//

import SwiftUI
import Lottie

struct AwardDetailView: View {
    
    private let quote: QuoteItemModel
    
    init(quote: QuoteItemModel) {
        self.quote = quote
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(quote.title)
                .font(.title)
                .foregroundStyle(.indigo)
                .bold()
            Text(quote.description)
                .font(.callout)
            Spacer()
            LottieView(animation: .named(AppAnimations.quote))
                .playing()
        }
        .padding()
        .navigationTitle(quote.author)
    }
}

#Preview {
    AwardDetailView(quote: AwardsViewModel().todaysQuote)
}

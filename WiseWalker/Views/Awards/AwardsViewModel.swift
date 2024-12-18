//
//  AwardsViewModel.swift
//  WiseWalker
//
//  Created by Mavlon Ergashev on 18/12/24.
//

import Foundation

protocol PrizeCalculator: AnyObject {
    var needs: Int { get set }
    var achievedTodaysPrize: Bool { get set }
}

@Observable
final class AwardsViewModel: PrizeCalculator {
    
    var needs: Int = 0
    var achievedTodaysPrize: Bool = false
    
    var todaysQuote: QuoteItemModel = QuoteItemModel(
        title: "You may say I'm a dreamer, but I'm not the only one",
        author: "John Lennon",
        description: "aa"
    )
    
    var unlockedQuotes: [QuoteItemModel] = [
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
    
}

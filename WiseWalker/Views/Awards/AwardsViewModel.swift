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
        title: "The only limit to our realization of tomorrow is our doubts of today.",
        author: "Franklin D. Roosevelt",
        description: "This quote emphasizes the importance of overcoming self-doubt to achieve a brighter future. It reminds us that our potential is limitless when we believe in ourselves. By focusing on possibilities rather than fears, we can turn our aspirations into reality."
    )

    var unlockedQuotes: [QuoteItemModel] = [
        QuoteItemModel(
            title: "The purpose of our lives is to be happy.",
            author: "Dalai Lama",
            description: "The quote encapsulates the idea that happiness is the ultimate goal in life. It encourages individuals to seek joy and fulfillment, highlighting the importance of inner peace and contentment. By prioritizing happiness, we can lead more meaningful and satisfying lives."
        ),
        QuoteItemModel(
            title: "Life is what happens when you're busy making other plans.",
            author: "John Lennon",
            description: "This quote serves as a reminder to appreciate the present moment, as life unfolds while we are preoccupied with future plans. It urges us to stay mindful and cherish the experiences and relationships that make life truly worthwhile."
        ),
        QuoteItemModel(
            title: "Get busy living or get busy dying.",
            author: "Stephen King",
            description: "A call to action that encourages one to actively engage in life rather than just exist. It challenges us to make the most of our time and pursue our passions wholeheartedly, reminding us that life is too precious to waste."
        ),
        QuoteItemModel(
            title: "You only live once, but if you do it right, once is enough.",
            author: "Mae West",
            description: "This quote inspires individuals to live a fulfilling life, making the most out of every moment. It suggests that by living authentically and embracing opportunities, we can create a life rich with experiences and memories."
        ),
        QuoteItemModel(
            title: "Many of life’s failures are people who did not realize how close they were to success when they gave up.",
            author: "Thomas A. Edison",
            description: "It highlights the importance of persistence, suggesting that success might be just around the corner. This quote teaches us to persevere through challenges and to not let temporary setbacks define our journey."
        ),
        QuoteItemModel(
            title: "If you want to live a happy life, tie it to a goal, not to people or things.",
            author: "Albert Einstein",
            description: "This quote advises focusing on personal ambitions rather than external factors to find contentment. It encourages setting meaningful goals and working towards them, which can bring a deeper sense of purpose and happiness."
        ),
        QuoteItemModel(
            title: "Never let the fear of striking out keep you from playing the game.",
            author: "Babe Ruth",
            description: "This encourages taking risks and not being afraid of failure in pursuit of one's goals. It inspires us to embrace challenges with courage and view failures as stepping stones to success."
        ),
        QuoteItemModel(
            title: "Success is not final, failure is not fatal: It is the courage to continue that counts.",
            author: "Winston Churchill",
            description: "It teaches that both success and failure are temporary, and the real test is perseverance. This quote motivates us to keep going despite obstacles, emphasizing that resilience is the key to long-term achievement."
        ),
        QuoteItemModel(
            title: "You miss 100% of the shots you don’t take.",
            author: "Wayne Gretzky",
            description: "A motivational quote urging people to take opportunities and not let fear of failure prevent them from trying. It reminds us that every missed opportunity is a chance lost, and encourages us to take bold actions."
        )
    ]

    
}

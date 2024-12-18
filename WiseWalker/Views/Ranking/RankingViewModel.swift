//
//  RankingViewModel.swift
//  WiseWalker
//
//  Created by Mavlon Ergashev on 18/12/24.
//

import Foundation

@Observable
final class RankingViewModel {
    
    var topToday: [RankingModel] = [
        RankingModel(name: "Raheem", steps: 19301),
        RankingModel(name: "Monica", steps: 18029),
        RankingModel(name: "Steve", steps: 15773),
        RankingModel(name: "Luigi", steps: 13101),
        RankingModel(name: "Vlad", steps: 12489),
        RankingModel(name: "Abdusamad", steps: 12033),
        RankingModel(name: "Gabriel", steps: 11812),
        RankingModel(name: "Julien", steps: 10605),
        RankingModel(name: "Luca", steps: 9934),
        RankingModel(name: "Matteo", steps: 9528)
    ]
    
    var topWeek: [RankingModel] = [
        RankingModel(name: "Raheem", steps: 133011),
        RankingModel(name: "Monica", steps: 105231),
        RankingModel(name: "Steve", steps: 98056),
        RankingModel(name: "Luigi", steps: 90373),
        RankingModel(name: "Vlad", steps: 81316),
        RankingModel(name: "Abdusamad", steps: 78032),
        RankingModel(name: "Gabriel", steps: 75089),
        RankingModel(name: "Julien", steps: 69496),
        RankingModel(name: "Luca", steps: 65984),
        RankingModel(name: "Matteo", steps: 60882)
    ]
    
}

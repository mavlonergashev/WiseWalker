//
//  StepsViewModel.swift
//  WiseWalker
//
//  Created by Mavlon Ergashev on 14/12/24.
//

import Foundation

@Observable
final class StepsViewModel {
    var isLoading: Bool = true
    var steps: Double = 0
    var currentError: String? = nil
    
    private let dailyGoal: Double = 5000
    
    var remainingSteps: Double {
        dailyGoal - steps
    }
    
    var week: [DayStep] = [
        DayStep(name: "M", steps: 1341),
        DayStep(name: "T", steps: 4507),
        DayStep(name: "W", steps: 6482),
        DayStep(name: "Th", steps: 3345),
        DayStep(name: "F", steps: 7560),
        DayStep(name: "Sa", steps: 12401),
        DayStep(name: "Su", steps: 567)
    ]
    
    private let stepsLoader: StepsLoader
    
    init(stepsLoader: StepsLoader) {
        self.stepsLoader = stepsLoader
    }
    
    func loadSteps() {
        isLoading = true
        stepsLoader.getSteps { [weak self] result in
            switch result {
            case .loaded(let stepsModel):
                self?.steps = stepsModel.today
            case .error(let message):
                self?.currentError = message
            }
            self?.isLoading = false
        }
    }
    
}

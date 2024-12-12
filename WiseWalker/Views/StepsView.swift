//
//  StepsView.swift
//  WiseWalker
//
//  Created by Mavlon Ergashev on 11/12/24.
//

import SwiftUI
import HealthKit

struct StepsView: View {
    
    private let stepsLoader: StepsLoader
    
    init(stepsLoader: StepsLoader) {
        self.stepsLoader = stepsLoader
    }
    
    @State private var isLoading = true
    @State private var steps: Double = 0
    @State private var currentError: String?
    
    private var remainingStepsForAward: Double {
        5000 - steps
    }
    
    @State private var week = [
        DayStep(name: "M", steps: 1341),
        DayStep(name: "T", steps: 4507),
        DayStep(name: "W", steps: 6482),
        DayStep(name: "Th", steps: 3345),
        DayStep(name: "F", steps: 7560),
        DayStep(name: "Sa", steps: 12401),
        DayStep(name: "Su", steps: 567)
    ]
    
    var body: some View {
        NavigationStack {
            Group {
                switch (isLoading, currentError) {
                case (true, _):
                    LoadingView()
                case (false, nil):
                    VStack {
                        Spacer()
                        CircularStepsView(steps: steps)
                        Spacer()
                        TodaysPrizeLabel(stepsLeft: remainingStepsForAward)
                        Spacer()
                        WeeklyStepsView(week: week)
                        Spacer()
                    }
                case (false, .some(let errorMessage)):
                    Text(errorMessage)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Steps")
        }
        .onAppear {
            stepsLoader.getSteps { result in
                switch result {
                case .loaded(let stepsModel):
                    steps = stepsModel.today
                case .error(let message):
                    currentError = message
                }
                isLoading = false
            }
        }
    }

}

#Preview {
    StepsView(stepsLoader: HealthService())
}

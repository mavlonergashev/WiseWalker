//
//  StepsView.swift
//  WiseWalker
//
//  Created by Mavlon Ergashev on 11/12/24.
//

import SwiftUI
import HealthKit

struct StepsView: View {
    
    @State private var viewModel: StepsViewModel
    
    init(viewModel: StepsViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationStack {
            Group {
                switch (viewModel.isLoading, viewModel.currentError) {
                case (true, _):
                    LoadingView()
                case (false, nil):
                    VStack {
                        Spacer()
                        CircularStepsView(steps: viewModel.steps)
                        Spacer()
                        TodaysPrizeLabel(stepsLeft: viewModel.remainingSteps)
                        Spacer()
                        WeeklyStepsView(week: viewModel.week)
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
            viewModel.loadSteps()
        }
    }

}

#Preview {
    StepsView(viewModel: StepsViewModel(stepsLoader: HealthService()))
}

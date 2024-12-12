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
    
    var body: some View {
        NavigationStack {
            Group {
                switch (isLoading, currentError) {
                case (true, _):
                    ProgressView()
                        .progressViewStyle(.circular)
                case (false, nil):
                    CircularStepsView(steps: steps)
                case (false, .some(let errorMessage)):
                    Text(errorMessage)
                }
            }
            .navigationTitle("Today's steps")
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

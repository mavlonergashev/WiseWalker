//
//  MainView.swift
//  WiseWalker
//
//  Created by Mavlon Ergashev on 11/12/24.
//

import SwiftUI

struct MainView: View {
    
    private let stepsLoader = HealthService()
    private let awardsViewModel = AwardsViewModel()
    
    var body: some View {
        TabView {
            StepsView(viewModel: StepsViewModel(stepsLoader: stepsLoader))
                .tabItem {
                    Label("Steps", systemImage: "figure.stairs")
                }
            AwardsView(viewModel: awardsViewModel)
                .tabItem {
                    Label("Awards", systemImage: "brain.filled.head.profile")
                }
            RankingView(viewModel: RankingViewModel())
                .tabItem {
                    Label("Ranking", systemImage: "chart.bar.xaxis.ascending")
                }
        }
        .onAppear {
            stepsLoader.prizeCalculator = awardsViewModel
        }
    }
}

#Preview {
    MainView()
}

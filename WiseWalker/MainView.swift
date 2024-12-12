//
//  MainView.swift
//  WiseWalker
//
//  Created by Mavlon Ergashev on 11/12/24.
//

import SwiftUI

struct MainView: View {
    
    var body: some View {
        TabView {
            StepsView()
                .tabItem {
                    Label("Steps", systemImage: "figure.stairs")
                }
            AwardsView()
                .tabItem {
                    Label("Awards", systemImage: "brain.filled.head.profile")
                }
            RankingView()
                .tabItem {
                    Label("Ranking", systemImage: "chart.bar.xaxis.ascending")
                }
        }
    }
}

#Preview {
    MainView()
}

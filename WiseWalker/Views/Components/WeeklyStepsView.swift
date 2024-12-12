//
//  WeeklyStepsView.swift
//  WiseWalker
//
//  Created by Mavlon Ergashev on 12/12/24.
//

import SwiftUI
import Charts

struct WeeklyStepsView: View {
    private let week: [DayStep]
    @State private var animationState = false
    
    init(week: [DayStep]) {
        self.week = week
    }
    
    var body: some View {
        Chart(week, id: \.name) {
            BarMark(
                x: .value("Week", $0.name),
                y: .value("Steps", $0.steps),
                stacking: .standard
            )
            .foregroundStyle(.regularMaterial)
        }
        .chartYAxis {
            AxisMarks {
                AxisValueLabel()
            }
        }
        .chartXAxis {
            AxisMarks {
                AxisValueLabel()
            }
        }
        .frame(height: 200)
        .padding(.horizontal, 16)
        .offset(y: animationState ? 0 : 400)
        .animation(.bouncy, value: animationState)
        .onAppear {
            DispatchQueue.main.asyncAfter(wallDeadline: .now() + 0.01) {
                animationState = true
            }
        }
    }
}

struct DayStep {
    let name: String
    let steps: Double
}

#Preview {
    WeeklyStepsView(week: [
        DayStep(name: "M", steps: 1341),
        DayStep(name: "T", steps: 4507),
        DayStep(name: "W", steps: 6482),
        DayStep(name: "Th", steps: 3345),
        DayStep(name: "F", steps: 7560),
        DayStep(name: "Sa", steps: 12401),
        DayStep(name: "Su", steps: 567)
    ])
}

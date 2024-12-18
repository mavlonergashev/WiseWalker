//
//  TodaysPrizeLabel.swift
//  WiseWalker
//
//  Created by Mavlon Ergashev on 12/12/24.
//

import SwiftUI

struct TodaysPrizeLabel: View {
    
    private let stepsLeft: Int
    
    @State private var animateState = false
    
    init(stepsLeft: Int) {
        self.stepsLeft = stepsLeft
    }
    
    var body: some View {
        Group {
            if stepsLeft > 0 {
                VText(
                    stepsLeft.formatted(),
                    subtitle: "steps left to get today's prize✨"
                )
            } else {
                CapsuleText("You already got today's prize😊")
            }
        }
        .scaleEffect(animateState ? 1 : 0.1)
        .animation(.bouncy, value: animateState)
        .onAppear {
            animateState = true
        }
    }
}

#Preview {
    TodaysPrizeLabel(stepsLeft: 2300)
}

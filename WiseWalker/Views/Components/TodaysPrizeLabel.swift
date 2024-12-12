//
//  TodaysPrizeLabel.swift
//  WiseWalker
//
//  Created by Mavlon Ergashev on 12/12/24.
//

import SwiftUI

struct TodaysPrizeLabel: View {
    
    private let stepsLeft: Double
    
    init(stepsLeft: Double) {
        self.stepsLeft = stepsLeft
    }
    
    var body: some View {
        Text(
            stepsLeft > 0 ?
             "\(stepsLeft.formatted()) steps left to get today's prize✨"
             : "You already got today's prize😊"
        )
    }
}

#Preview {
    TodaysPrizeLabel(stepsLeft: 2300)
}

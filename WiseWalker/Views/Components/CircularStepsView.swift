//
//  CircularStepsView.swift
//  WiseWalker
//
//  Created by Mavlon Ergashev on 12/12/24.
//

import SwiftUI

struct CircularStepsView: View {
    
    @State private var steps: Double
    @State private var animationAmount = 1.0
    @State private var animationState = false
    
    init(steps: Double) {
        self.steps = steps
    }
    
    var body: some View {
        ZStack {
            Circle()
                .fill(.indigo)
                .frame(width: 200, height: 200)
                .overlay(
                    Circle()
                        .stroke(.blue)
                        .scaleEffect(animationAmount)
                        .opacity(2 - animationAmount)
                        .animation(
                            .easeOut(duration: 1)
                            .repeatForever(autoreverses: false),
                            value: animationAmount
                        )
                )
            Circle()
                .fill(.black)
                .frame(width: 130, height: 130)
            VStack {
                Text(steps.formatted())
                    .foregroundStyle(.white)
                    .font(.largeTitle).bold()
                Text("steps")
                    .foregroundStyle(.gray)
                    .font(.title).bold()
            }
        }
        .offset(y: animationState ? 0 : -400)
        .animation(.bouncy, value: animationState)
        .onAppear {
            animationAmount = 1.3
            DispatchQueue.main.asyncAfter(wallDeadline: .now() + 0.1) {
                animationState = true
            }
        }
    }
}

#Preview {
    CircularStepsView(steps: 5300)
}

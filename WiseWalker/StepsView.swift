//
//  StepsView.swift
//  WiseWalker
//
//  Created by Mavlon Ergashev on 11/12/24.
//

import SwiftUI
import HealthKit

struct StepsView: View {
    
    let healthStore = HKHealthStore()
    
    @State private var steps: Double = 0
    @State private var currentError: String?
    
    @State private var animationAmount = 1.0
    
    var body: some View {
        NavigationStack {
            ZStack {
                if let currentError {
                    Text(currentError)
                } else {
                    Circle()
                        .fill(.indigo)
                        .frame(width: 200, height: 200)
                        .overlay(
                            Circle()
                                .stroke(.red)
                                .scaleEffect(animationAmount)
                                .opacity(2 - animationAmount)
                                .animation(
                                    .easeOut(duration: 1)
                                    .repeatForever(autoreverses: false),
                                    value: animationAmount
                                )
                        )
                    Circle()
                        .fill(.white)
                        .frame(width: 150, height: 150)
                    VStack {
                        Text(String(format: "%.0f", steps))
                            .font(.title).bold()
                        Text("steps")
                            .font(.title).bold()
                    }
                }
            }
            .navigationTitle("Today's steps")
        }
        .onAppear {
            if HKHealthStore.isHealthDataAvailable() {
                let stepType = HKQuantityType.quantityType(forIdentifier: .stepCount)!
                let readDataTypes: Set = [stepType]
                
                healthStore.requestAuthorization(toShare: nil, read: readDataTypes) { success, error in
                    if success {
                        fetchTodaySteps { steps, error in
                            if steps > 0 {
                                self.steps = steps
                                self.animationAmount = 1.5
                            } else if let error {
                                self.currentError = error.localizedDescription
                            }
                        }
                    } else {
                        self.currentError = "Authorization denied: \(String(describing: error))"
                    }
                }
            }
            
            
            
        }
    }
    
    private func fetchTodaySteps(completion: @escaping (Double, Error?) -> Void) {
        let stepType = HKQuantityType.quantityType(forIdentifier: .stepCount)!
        
        // Start and end of the day
        let calendar = Calendar.current
        let startOfDay = calendar.startOfDay(for: Date())
        let now = Date()
        
        // Define the predicate for today's data
        let predicate = HKQuery.predicateForSamples(withStart: startOfDay, end: now, options: .strictStartDate)
        
        // Query to get step count
        let query = HKStatisticsQuery(quantityType: stepType, quantitySamplePredicate: predicate, options: .cumulativeSum) { _, result, error in
            var steps = 0.0
            
            if let quantity = result?.sumQuantity() {
                steps = quantity.doubleValue(for: HKUnit.count())
            }
            
            completion(steps, error)
        }
        
        healthStore.execute(query)
    }

}

#Preview {
    StepsView()
}

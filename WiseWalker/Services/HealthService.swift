//
//  HealthService.swift
//  WiseWalker
//
//  Created by Mavlon Ergashev on 12/12/24.
//

import HealthKit

protocol StepsLoader {
    func getSteps(completion: @escaping (StepsResult) -> Void)
}

final class HealthService: StepsLoader {
    
    private let healthStore = HKHealthStore()
    
    func getSteps(completion: @escaping (StepsResult) -> Void) {
        guard HKHealthStore.isHealthDataAvailable() else {
            completion(.error(HealthServiceErrors.dataNotAvailable))
            return
        }
        
        guard
            let stepType = HKQuantityType.quantityType(forIdentifier: .stepCount),
            let walkingSpeedType = HKQuantityType.quantityType(forIdentifier: .walkingSpeed),
            let walkingDistanceType = HKQuantityType.quantityType(forIdentifier: .distanceWalkingRunning)
        else {
            completion(.error(HealthServiceErrors.requestError))
            return
        }
        
        let readDataTypes: Set = [stepType, walkingSpeedType, walkingDistanceType]
        
        healthStore.requestAuthorization(toShare: nil, read: readDataTypes) { [weak self] success, error in
            if success {
                self?.fetchTodaySteps(completion: completion)
            } else {
                guard let error else {
                    completion(.error(HealthServiceErrors.unknown))
                    return
                }
                completion(.error(error.localizedDescription))
            }
        }
    }
    
    private func fetchTodaySteps(completion: @escaping (StepsResult) -> Void) {
        let stepType = HKQuantityType.quantityType(forIdentifier: .stepCount)!
        
        let calendar = Calendar.current
        let startOfDay = calendar.startOfDay(for: Date())
        let now = Date()
        
        // Define the predicate for today's data
        let predicate = HKQuery.predicateForSamples(withStart: startOfDay, end: now, options: .strictStartDate)
        
        // Query to get step count
        let query = HKStatisticsQuery(
            quantityType: stepType,
            quantitySamplePredicate: predicate,
            options: .cumulativeSum
        ) { _, result, error in
            if let result {
                guard let quantity = result.sumQuantity() else {
                    completion(.error(HealthServiceErrors.stepsNotFound))
                    return
                }
                let steps = quantity.doubleValue(for: .count())
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    completion(.loaded(StepsModel(today: steps, week: [])))
                }
            } else {
                guard let error else {
                    completion(.error(HealthServiceErrors.unknown))
                    return
                }
                completion(.error(error.localizedDescription))
            }
        }
        
        healthStore.execute(query)
    }
    
}

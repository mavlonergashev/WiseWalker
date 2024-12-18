//
//  Double+Extension.swift
//  WiseWalker
//
//  Created by Mavlon Ergashev on 12/12/24.
//

import Foundation

extension Double {
    func formatted() -> String {
        String(format: "%.0f", self)
    }
}

extension Int {
    func formatted() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = " " // Use space as the thousand separator
        return formatter.string(from: NSNumber(value: self)) ?? "\(self)"
    }
}

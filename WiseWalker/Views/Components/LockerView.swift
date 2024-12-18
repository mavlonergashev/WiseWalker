//
//  LockerView.swift
//  WiseWalker
//
//  Created by Mavlon Ergashev on 18/12/24.
//

import SwiftUI

struct LockerView: View {
    private let needs: Int
    
    init(needs: Int) {
        self.needs = needs
    }
    
    var body: some View {
        RoundedRectangle(cornerRadius: 12)
            .fill(.ultraThinMaterial)
            .overlay(
                HStack {
                    Image(systemName: "lock.fill")
                        .font(.title3)
                        .foregroundColor(.indigo)
                    Text("Needs \(needs.formatted()) more steps")
                        .foregroundStyle(.secondary)
                        .font(.title3)
                        .bold()
                }
            )
    }
}

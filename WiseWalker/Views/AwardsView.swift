//
//  AwardsView.swift
//  WiseWalker
//
//  Created by Mavlon Ergashev on 11/12/24.
//

import SwiftUI

struct AwardsView: View {
    var body: some View {
        NavigationStack {
            List {
                ForEach(0..<25) {
                    Text("Content \($0)")
                }
            }
            .navigationTitle("Awards")
        }
    }
}

#Preview {
    AwardsView()
}

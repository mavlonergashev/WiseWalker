//
//  RankingView.swift
//  WiseWalker
//
//  Created by Mavlon Ergashev on 11/12/24.
//

import SwiftUI

struct RankingView: View {
    var body: some View {
        NavigationStack {
            List {
                Section("Top today") {
                    ForEach(0..<10) { index in
                        HStack {
                            Image(systemName: index > 2 ? "medal.fill" : "trophy.fill")
                                .foregroundStyle(
                                    index == 0 ? .yellow :
                                        index == 1 ? .gray :
                                        index == 2 ? .brown : .secondary
                                )
                            Text("Random name")
                            Spacer()
                            Text("\(Int.random(in: 8000...20000).formatted()) steps")
                                .foregroundStyle(.indigo)
                                .bold()
                        }
                    }
                }
                Section("Top week") {
                    ForEach(0..<10) { index in
                        HStack {
                            Image(systemName: index > 2 ? "medal.fill" : "trophy.fill")
                                .foregroundStyle(
                                    index == 0 ? .yellow :
                                        index == 1 ? .gray :
                                        index == 2 ? .brown : .secondary
                                )
                            Text("Random name")
                            Spacer()
                            Text("\(Int.random(in: 40000...140000).formatted()) steps")
                                .foregroundStyle(.indigo)
                                .bold()
                        }
                    }
                }
            }
            .navigationTitle("Ranking")
        }
    }
}

#Preview {
    RankingView()
}

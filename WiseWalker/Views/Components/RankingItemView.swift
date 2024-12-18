//
//  RankingItemView.swift
//  WiseWalker
//
//  Created by Mavlon Ergashev on 18/12/24.
//

import SwiftUI

struct RankingItemView: View {
    let index: Int
    let item: RankingModel
    
    var body: some View {
        HStack {
            Image(systemName: index > 2 ? "medal.fill" : "trophy.fill")
                .foregroundStyle(
                    index == 0 ? .yellow :
                        index == 1 ? .gray :
                        index == 2 ? .brown : .secondary
                )
            Text(item.name)
            Spacer()
            Text(item.steps.formatted())
                .foregroundStyle(.indigo)
                .bold()
        }
    }
}

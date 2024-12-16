//
//  VText.swift
//  WiseWalker
//
//  Created by Mavlon Ergashev on 16/12/24.
//

import SwiftUI

struct VText: View {
    private let title: String
    private let subtitle: String
    
    init(_ title: String, subtitle: String) {
        self.title = title
        self.subtitle = subtitle
    }
    
    var body: some View {
        VStack {
            Text(title)
                .font(.largeTitle)
                .bold()
            Text(subtitle)
        }
    }
}

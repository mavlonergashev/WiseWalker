//
//  LoadingView.swift
//  WiseWalker
//
//  Created by Mavlon Ergashev on 12/12/24.
//

import SwiftUI
import Lottie

struct LoadingView: View {
    var body: some View {
        LottieView(animation: .named(AppAnimations.loading))
          .looping()
    }
}

#Preview {
    LoadingView()
}

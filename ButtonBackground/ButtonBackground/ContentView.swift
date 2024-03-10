//
//  ContentView.swift
//  NextAnimation
//
//  Created by Irlan Abushakhmanov on 06.03.2024.
//

import SwiftUI

struct ContentView: View {
    private enum Constants {
        static let nextWidth = 32.0
        static let spacing = -1.0
        static let normalScale = 1.0
        static let offset = nextWidth + spacing
        static let animation = Animation.spring(duration: 0.4, bounce: 0.4)
    }

    @State private var scale: CGFloat = Constants.normalScale
    @State private var offset: CGFloat = .zero

    var body: some View {
        Button {
            withAnimation(Constants.animation) {
                offset = Constants.offset
                scale = .zero
            } completion: {
                offset = .zero
                scale = Constants.normalScale
            }
        } label: {
            buttonView
        }
        .buttonStyle(NextStyle())
    }

    private var buttonView: some View {
        HStack(spacing: Constants.spacing) {
            ZStack {
                NextView(width: Constants.nextWidth)
                    .scaleEffect(1 - scale, anchor: .leading)
                NextView(width: Constants.nextWidth, offset: $offset)
            }
            NextView(width: Constants.nextWidth)
                .scaleEffect(scale, anchor: .trailing)
        }
    }
}

#Preview {
    ContentView()
}

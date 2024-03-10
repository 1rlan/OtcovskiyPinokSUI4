//
//  NextStyle.swift
//  ButtonBackground
//
//  Created by Irlan Abushakhmanov on 09.03.2024.
//

import SwiftUI

struct NextStyle: ButtonStyle {
    private enum Constants {
        static let duraton = 0.22
        static let padding = -30.0
        static let backgroundOpacity = 0.15
        static let scales = (animationScale: 0.86, normalScale: 1.0)
        static let animation = Animation.easeOut(duration: duraton)
    }

    @State private var isAnimateable = false

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .background { circleBackground }
            .animation(Constants.animation, value: configuration.isPressed)
            .scaleEffect(isAnimateable ? Constants.scales.animationScale : Constants.scales.normalScale)
            .onChange(of: configuration.isPressed) { toggleAnimation(isPressed: configuration.isPressed) }
    }

    private var circleBackground: some View {
        Circle()
            .padding(Constants.padding)
            .foregroundColor(.gray.opacity(isAnimateable ? Constants.backgroundOpacity : .zero))
    }

    private func toggleAnimation(isPressed: Bool) {
        withAnimation(Constants.animation.delay(isPressed ? .zero : Constants.duraton)) {
            isAnimateable.toggle()
        }
    }
}

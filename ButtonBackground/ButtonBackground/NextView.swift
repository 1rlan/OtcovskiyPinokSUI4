//
//  NextView.swift
//  NextAnimation
//
//  Created by Irlan Abushakhmanov on 06.03.2024.
//

import SwiftUI

struct NextView: View {
    @Binding var offset: CGFloat
    private let width: CGFloat

    init(width: CGFloat, offset: Binding<CGFloat> = .constant(0)) {
        self.width = width
        self._offset = offset
    }

    var body: some View {
        Image(systemName: "play.fill")
            .resizable()
            .scaledToFit()
            .frame(width: width)
            .offset(x: offset)
    }
}

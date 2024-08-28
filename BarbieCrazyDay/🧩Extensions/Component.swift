//
//  Component.swift
//  BarbieCrazyDay
//
//  Created by Janiece Eleonour on 27.08.2024.
//

import SwiftUI

public struct TextOnBoardStyle: ViewModifier {
    public func body(content: Content) -> some View {
        content
            .font(.cherryBombOne(.regular, size: 15))
            .foregroundColor(.white)
            .shadow(color: .fontShadow, radius: 4, x: 0, y: 4)
    }
}

extension View {
    public var textOnBoardStyle: some View {
        modifier(TextOnBoardStyle())
    }
}

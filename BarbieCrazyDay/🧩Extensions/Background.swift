//
//  Background.swift
//  BarbieCrazyDay
//
//  Created by Janiece Eleonour on 23.08.2024.
//

import SwiftUI

public struct AppBackground: ViewModifier {
    let imageResource: ImageResource
    
    init(_ imageResource: ImageResource) {
        self.imageResource = imageResource
    }
    
    public func body(content: Content) -> some View {
        content
            .background { Image(imageResource).resizable().ignoresSafeArea() }
    }
}

public struct BoardBackground: ViewModifier {
    private var background: some View {
        RoundedRectangle(cornerRadius: 33)
            .stroke(Color.white,
                    style: StrokeStyle(lineWidth: 7,
                                       lineCap: .round,
                                       lineJoin: .round,
                                       dash: [10, 12]
                                      )
            )
            .background(
                RoundedRectangle(cornerRadius: 33)
                    .fill(
                        Color.descriptionGradient.opacity(0.85)
                            .shadow(.inner(color: Color.boardShadow, radius: 64))
                    )
            )
    }
    
    public func body(content: Content) -> some View {
        content
            .padding(10)
            .frame(maxWidth: .infinity)
            .background(
                background
            )
    }
}

public struct BetBoardBackground: ViewModifier {
    private var background: some View {
        RoundedRectangle(cornerRadius: 29)
            .foregroundStyle(.clear)
            .background(
                RoundedRectangle(cornerRadius: 29)
                    .fill(Color.betBoardGradient)
                    .shadow(color: .white, radius: 23.06)
                    .shadow(color: .white, radius: 17.3, y: 1.95)
            )
    }
    
    public func body(content: Content) -> some View {
        content
            .padding(10)
            .frame(maxWidth: .infinity)
            .background(
                background
            )
    }
}

extension View {
    public var boardBackground: some View {  modifier(BoardBackground()) }
    public var betBoardBackground: some View {  modifier(BetBoardBackground()) }
}

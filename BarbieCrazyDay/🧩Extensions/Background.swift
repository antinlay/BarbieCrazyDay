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

public struct TimeBoardBackground: ViewModifier {
    private var timeBoardRectangle: some View {
        RoundedRectangle(cornerRadius: 21.5)
            .stroke(Color.borderWalletColor, lineWidth: 2)
            .background(
                RoundedRectangle(cornerRadius: 21.5)
                    .fill(Color.walletGradient)
            )
    }
    
    public func body(content: Content) -> some View {
        content
            .background(timeBoardRectangle)
    }
}


public struct WalletBackground: ViewModifier {
    private var walletCapsule: some View {
        Capsule()
            .stroke(Color.borderWalletColor, lineWidth: 2)
            .background(
                Capsule()
                    .fill(Color.walletGradient)
            )
    }
    
    public func body(content: Content) -> some View {
        content
            .padding(.vertical, 7)
            .padding(.horizontal)
            .background(walletCapsule)
    }
}

public struct BoardBackground: ViewModifier {
    private var boardRectangle: some View {
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
            .background(boardRectangle)
    }
}

public struct BetBoardBackground: ViewModifier {
    private var betBoardRectagle: some View {
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
            .background(betBoardRectagle)
    }
}

public struct StrokeText : ViewModifier {
    private let id = UUID()
    var width: Double
    var color: Color
    
    public func body(content: Content) -> some View {
        content
            .padding(width*2)
            .background(
                Rectangle()
                    .foregroundStyle(color)
                    .mask({
                        outline(context: content)
                    })
            )
    }
    
    public func outline(context:Content) -> some View {
        Canvas { context, size in
            context.addFilter(.alphaThreshold(min: 0.01))
            context.drawLayer { layer in
                if let text = context.resolveSymbol(id: id) {
                    layer.draw(text, at: .init(x: size.width/2, y: size.height/2))
                }
            }
        } symbols: {
            context.tag(id)
                .blur(radius: width)
        }
    }
}

extension View {
    public var boardBackground: some View { modifier(BoardBackground()) }
    public var betBoardBackground: some View { modifier(BetBoardBackground()) }
    public var walletBackground: some View { modifier(WalletBackground()) }
    public var timeBoardBackground: some View { modifier(TimeBoardBackground()) }

    public func strokeText(width: Double, color: Color) -> some View {  modifier(StrokeText(width: width, color: color)) }
}

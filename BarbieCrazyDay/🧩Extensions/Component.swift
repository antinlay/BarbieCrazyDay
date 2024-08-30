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

public struct PauseSheet: ViewModifier {
    @EnvironmentObject private var router: Router
    @Binding var isPresented: Bool
    
    private var pauseSheet: some View {
        VStack(spacing: -65) {
            Image(.Thunderstorm.candyBall)
            VStack(spacing: 5) {
                SheetContinueButton {
                    isPresented = false
                }
                SheetHowToButton {
                    router.navigate(to: .menu)
                }
                SheetHomeButton {
                    router.navigate(to: .menu)
                }
            }
        }
    }

    public func body(content: Content) -> some View {
        content
            .fullScreenCover(isPresented: $isPresented) {
                    pauseSheet
                        .presentationBackground(.ultraThinMaterial)
            }

    }
}

extension View {
    public var textOnBoardStyle: some View { modifier(TextOnBoardStyle()) }
    public func pauseSheet(isPresented: Binding<Bool>) -> some View { modifier(PauseSheet(isPresented: isPresented)) }
}

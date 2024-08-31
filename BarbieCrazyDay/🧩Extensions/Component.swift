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

public struct HowToSheet: ViewModifier {
    @Binding var isPresented: Bool
    var title: String
    var text: String
    
    private var howToSheet: some View {
        VStack {
            Text(title.uppercased())
                .font(.cherryBombOne(.regular, size: 25))
                .foregroundStyle(.accent)
            Text(text)
                .font(.cherryBombOne(.regular, size: 11))
                .foregroundColor(.white)
                .shadow(color: .fontShadow, radius: 4, x: 0, y: 4)
            Text("GOOD LUCK!")
                .font(.cherryBombOne(.regular, size: 25))
                .foregroundStyle(.accent)
        }
        .padding(.horizontal, 10)
        .boardBackground
        .overlay(alignment: .topTrailing) {
            Button {
                isPresented = false
            } label: {
                Image(.Thunderstorm.xButon)
            }
            .offset(x: 10, y: -10)
        }
        .padding(.horizontal)
    }
    
    public func body(content: Content) -> some View {
        content
            .fullScreenCover(isPresented: $isPresented) {
                howToSheet
                    .presentationBackground(.ultraThinMaterial)
            }
    }
}

public struct PauseSheet: ViewModifier {
    @EnvironmentObject private var router: Router
    @Binding var isPresented: Bool
    var howTowAction: () -> Void
    
    private var pauseSheet: some View {
        VStack(spacing: -65) {
            Image(.Thunderstorm.candyBall)
            VStack(spacing: 5) {
                SheetContinueButton {
                    isPresented = false
                }
                SheetHowToButton {
                    howTowAction()
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
    public func howToSheet(isPresented: Binding<Bool>, title: String, text: String) -> some View { modifier(HowToSheet(isPresented: isPresented, title: title, text: text))}
    public func pauseSheet(isPresented: Binding<Bool>, howTowAction: @escaping () -> Void) -> some View { modifier(PauseSheet(isPresented: isPresented, howTowAction: howTowAction)) }
}

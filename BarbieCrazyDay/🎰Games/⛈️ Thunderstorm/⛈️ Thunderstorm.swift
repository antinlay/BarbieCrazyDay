//
//  ⛈️ Thunderstorm.swift
//  BarbieCrazyDay
//
//  Created by Janiece Eleonour on 29.08.2024.
//

import SwiftUI

struct Thunderstorm: View {
    @EnvironmentObject private var router: Router
    @State private var isPausePresented = false
    @State private var multiplyNumber = 0
    
    private var betMultipluy: some View {
        Group {
            Text("x") +
            Text(multiplyNumber, format: .number)
        }
            .font(.cherryBombOne(.regular, size: 50))
            .foregroundColor(.white)
            .shadow(color: .shadowPinkColor, radius: 1, x: 0, y: 5)
    }
    
    var body: some View {
        ZStack {
            betMultipluy
                .alignmentPosition(.top)
                .padding(.top, 45)
            Image(.Thunderstorm.candyBall)
            HStack {
                PauseButton { isPausePresented = true }
                    .padding(.leading)
                Spacer()
                Wallet()
                    .padding(.trailing)
            }
            .alignmentPosition(.top)

            BetBoard()
                .alignmentPosition(.bottom)
        }
        .modifier(AppBackground(.Thunderstorm.background))
        .fullScreenCover(isPresented: $isPausePresented) {
                pauseSheet
                    .presentationBackground(.ultraThinMaterial)
        }
    }
    
    private var pauseSheet: some View {
        VStack(spacing: -65) {
            Image(.Thunderstorm.candyBall)
            VStack(spacing: 5) {
                SheetContinueButton {
                    isPausePresented = false
                }
                SheetHomeButton {
                    router.navigate(to: .menu)
                }
            }
        }
    }
    
}

#Preview {
    Thunderstorm()
}

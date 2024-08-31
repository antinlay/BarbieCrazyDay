//
//  🗻SnowMountains.swift
//  BarbieCrazyDay
//
//  Created by Janiece Eleonour on 29.08.2024.
//

import SwiftUI

extension SnowMountains {
    struct CoefficientButton: View {
        var item: ImageResource
        var coefficient: Double
        var placeholder: ImageResource = .Mountains.actionButton
        @State var isOpen = false
        var action: () -> Void
        
        var body: some View {
            Button {
                isOpen = true
                action()
            } label: {
                ZStack {
                    Image(item)
                        .opacity(isOpen ? 1 : 0)
                    Image(placeholder)
                        .opacity(isOpen ? 0 : 1)
                }
                .scaleEffect(isOpen ? 1.3 : 1)
            }
            .disabled(isOpen)
        }
    }
}

struct SnowMountains: View {
    @State var difficultLevelCases: DifficultyLevelCases = .easy
    @EnvironmentObject private var router: Router
    @State private var isPausePresented = false
    @State private var multiplyNumber: Double = 0
    @State private var isDifficltPresented = false
    @State private var gameStarted = false
    
    private var betMultipluy: some View {
        Group {
            Text("x") +
            Text(multiplyNumber, format: .number)
        }
        .font(.cherryBombOne(.regular, size: 25))
        .foregroundColor(.white)
        .strokeText(width: 0.5, color: .shadowPinkColor)
        .shadow(color: .shadowPinkColor, radius: 0.5, x: 0, y: 5)
    }
    
    private var changeLevel: some View {
        Button {
            isDifficltPresented = true
        } label: {
            Image(difficultLevelCases.info)
        }
    }
    
    var body: some View {
        ZStack {
            VStack {
                HStack(spacing: 0) {
                    PauseButton { isPausePresented = true }
                        .padding(.leading)
                    changeLevel
                    Spacer()
                    Wallet()
                        .padding(.trailing)
                }
                .alignmentPosition(.top)
                gameGrid
                    .alignmentPosition(.center)
                BetBoard()
                    .alignmentPosition(.bottom)
            }
        }.modifier(AppBackground(.Mountains.background))
            .pauseSheet(isPresented: $isPausePresented)
            .fullScreenCover(isPresented: $isDifficltPresented) {
                difficultLevel
                    .presentationBackground(.ultraThinMaterial)
            }
    }
    
    private var gameGrid: some View {
        LazyHGrid(rows: Array(repeating: GridItem(.fixed(60)), count: 8)) {
            ForEach(Array(difficultLevelCases.coefficient.enumerated()), id: \.offset) { index, coefficient in
                rowCoefficient(coefficient)
            }
        }
    }
    
    private func rowCoefficient(_ coefficient: Double) -> some View {
        LazyHStack(spacing: 0) {
            ForEach(difficultLevelCases.items, id: \.self) { item in
                CoefficientButton(item: item, coefficient: coefficient) {
                    multiplyNumber += item == .SunnyDay.bomb ? 0 : coefficient
                }
                .opacity(gameStarted ? 1 : 0.5)
                .disabled(!gameStarted)
            }
        }
    }
    
    private var difficultLevel: some View {
        VStack {
            Text("Select your\ndifficulty\nlevel:".uppercased())
                .font(.cherryBombOne(.regular, size: 25))
                .foregroundStyle(.white)
                .multilineTextAlignment(.center)
                .shadow(color: .black, radius: 4, x: 0, y: 4)
            ForEach(DifficultyLevelCases.allCases, id: \.self) { difficult in
                Button {
                    difficultLevelCases = difficult
                    isDifficltPresented = false
                } label: {
                    Image(difficult.button)
                }
            }
        }
    }
    
}

#Preview {
    SnowMountains()
}

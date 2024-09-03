//
//  🗻SnowMountains.swift
//  BarbieCrazyDay
//
//  Created by Janiece Eleonour on 29.08.2024.
//

import SwiftUI

struct SnowMountains: View {
    @EnvironmentObject private var router: Router
    @EnvironmentObject private var betModel: BetModel
    
    @State private var difficultLevelCases: DifficultyLevelCases = .easy
    @State private var rowIndex = 7
    @State private var isWinnerPresented = false
    @State private var isPausePresented = false
    @State private var isHowToPresented = false
    @State private var isDifficultPresented = true
    
    private var changeLevel: some View {
        Button {
            isDifficultPresented = true
        } label: {
            Image(difficultLevelCases.info)
        }
        .disabled(betModel.isGameStarted)
    }
    
    var body: some View {
        ZStack {
            Group {
                HStack(spacing: 0) {
                    PauseButton { isPausePresented = true }
                        .padding(.leading)
                    changeLevel
                    Spacer()
                    Wallet()
                        .padding(.trailing)
                }
                gameGrid
                    .padding(.top, -65)
            }
            .alignmentPosition(.top)
            BetBoard { isWinnerPresented = true }
                .alignmentPosition(.bottom)
        }.modifier(AppBackground(.Mountains.background))
            .pauseSheet(isPresented: $isPausePresented) {
                isPausePresented = false
                isHowToPresented = true
            }
            .howToSheet(isPresented: $isHowToPresented, title: SnowMountains.howToTitle, text: SnowMountains.howToText)
            .fullScreenCover(isPresented: $isDifficultPresented) {
                difficultLevel
                    .presentationBackground(.ultraThinMaterial)
            }
            .fullScreenCover(isPresented: $isWinnerPresented) {
                Winner(background: .SunnyDay.background, winnerCase: .victory)
            }
    }
    
    private var gameGrid: some View {
        LazyHGrid(rows: Array(repeating: GridItem(.fixed(60)), count: 8)) {
            ForEach(Array(difficultLevelCases.coefficient.enumerated()), id: \.offset) { index, coefficient in
                RowButtons(rowIndex: $rowIndex, difficult: difficultLevelCases) {
                    if rowIndex != 0 {
                        rowIndex -= 1
                    } else {
                        betModel.takeButtonPressed()
                        isWinnerPresented = true
                    }
                }
                .disabled(!betModel.isGameStarted)
                .disabled(index < rowIndex)
                .opacity(index >= rowIndex ? 1 : 0.65)
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
                    isDifficultPresented = false
                    difficultLevelCases = difficult
                } label: {
                    Image(difficult.button)
                }
            }
        }
    }
}

#Preview {
    SnowMountains()
        .environmentObject(BetModel())
}

//
//  ☀️SunnyDay.swift
//  BarbieCrazyDay
//
//  Created by Janiece Eleonour on 29.08.2024.
//

import SwiftUI

struct SunnyDay: View {
    @EnvironmentObject private var betModel: BetModel
    
    @State private var isWinnerPresented = false
    @State private var isPausePresented = false
    @State private var isHowToPresented = true
    @State private var stepSpin: SunnyDayCases = .first
    @State private var isSpin: Bool = false
    
    private var gameDescription: some View {
        Group {
            switch betModel.isGameStarted {
            case false:
                Text("place a bet and press deal".uppercased())
            case true:
                Text("your current winnings: ".uppercased()) + Text(betModel.currentWinning, format: .number)
            }
        }
        .textOnBoardStyle
        .shadow(color: .black, radius: 4, x: 0, y: 4)
    }
    
    private var betMultipluy: some View {
        Group {
            Text("x") +
            Text(betModel.multiplyNumber, format: .number)
        }
        .font(.cherryBombOne(.regular, size: 50))
        .foregroundColor(.white)
        .strokeText(width: 1, color: .shadowPinkColor)
        .shadow(color: .shadowPinkColor, radius: 1, x: 0, y: 5)
    }
    
    private var nextStep: some View {
        Rectangle()
            .foregroundStyle(.clear)
            .background(
                RoundedRectangle(cornerRadius: 13)
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [.white, .clear]),
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )
            )
            .blur(radius: 30)
            .frame(width: 60, height: 251)
            .cornerRadius(13)
    }
    
    private func stepScore(_ step: SunnyDayCases) -> some View {
        Image(step.score)
            .overlay(alignment: .bottom) {
                Text(step.coefficient, format: .number)
                    .font(.dynamo(.regular, size: 14))
                    .foregroundStyle(.white)
                    .padding(.bottom, 3)
            }
    }
    
    private func spinNumber(_ index: Int) -> some View {
        Text(index + 1, format: .number)
            .font(.cherryBombOne(.regular, size: 20))
            .foregroundStyle(.white)
            .shadow(color: .fontShadow, radius: 4, x: 0, y: 4)
    }
    
    var body: some View {
        ZStack {
            fullScreenBackground(.SunnyDay.background)
            VStack {
                HStack {
                    PauseButton { isPausePresented = true }
                        .textOnBoardStyle
                        .padding(.leading)
                    gameDescription
                        .padding(.leading)
                    Spacer()
                    Wallet()
                        .padding(.trailing)
                }
                betMultipluy
                    .padding(.bottom, 56)
                Image(.SunnyDay.casinoBoard)
                    .overlay(alignment: .bottom) {
                        casinoBoard
                            .padding(.bottom, 10)
                    }
                    .aspectRatio(contentMode: .fit)
                Spacer()
            }
            BetBoardSunnyDay(stepSpin: $stepSpin, isSpin: $isSpin) {
                isWinnerPresented = true
            }
            .frame(maxHeight: .infinity, alignment: .bottom)
        }
        .pauseSheet(isPresented: $isPausePresented) {
            isPausePresented = false
            isHowToPresented = true
        }
        .howToSheet(isPresented: $isHowToPresented, title: SunnyDay.howToTitle, text: SunnyDay.howToText)
        .fullScreenCover(isPresented: $isWinnerPresented) {
            Winner(background: .SunnyDay.background, winnerCase: .victory)
        }
    }
    
    private var casinoBoard: some View {
        HStack(spacing: -50) {
            ForEach(Array(SunnyDayCases.allCases.enumerated()), id: \.offset) { index, step in
                ZStack {
                    stepScore(step)
                        .padding(.top, -63)
                        .alignmentPosition(.top)
                    nextStep
                        .padding(.top, -30)
                        .opacity(step == stepSpin ? 1 : 0)
                        .opacity(betModel.isGameStarted ? 1 : 0)
                    VStack(spacing: 0) {
                        SpinItems(index: index + 1, stepSpin: $stepSpin, isSpin: $isSpin)
                            .disabled(step != stepSpin)
                            .opacity(step == stepSpin ? 1 : 0.65)
                            .disabled(!betModel.isGameStarted)
                        spinNumber(index)
                            .padding(.bottom, -15)
                    }
                }
            }
        }
    }
}

#Preview {
    SunnyDay()
        .environmentObject(Router())
        .environmentObject(DefaultStorage())
        .environmentObject(BetModel())
}

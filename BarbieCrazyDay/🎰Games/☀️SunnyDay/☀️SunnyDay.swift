//
//  ☀️SunnyDay.swift
//  BarbieCrazyDay
//
//  Created by Janiece Eleonour on 29.08.2024.
//

import SwiftUI

enum SunnyDaysCases: CaseIterable {
    case first, second, third, fourth, fifth
    
    var score: ImageResource {
        switch self {
        case .first:
                .SunnyDay.bombScore
        case .second:
                .SunnyDay.brilliantScore
        case .third:
                .SunnyDay.orangeScore
        case .fourth:
                .SunnyDay.emeraldScore
        case .fifth:
                .SunnyDay.loveScore
        }
    }
    
    var item: ImageResource {
        switch self {
        case .first:
                .SunnyDay.bomb
        case .second:
                .SunnyDay.brilliant
        case .third:
                .SunnyDay.orange
        case .fourth:
                .SunnyDay.emerald
        case .fifth:
                .SunnyDay.love
        }
    }
    
    var coefficient: Double {
        switch self {
        case .first:
            0.25
        case .second:
            0.5
        case .third:
            1
        case .fourth:
            2
        case .fifth:
            5
        }
    }
    
    var next: SunnyDaysCases {
        if let index = SunnyDaysCases.allCases.firstIndex(of: self), index < SunnyDaysCases.allCases.count - 1 {
            return SunnyDaysCases.allCases[index + 1]
        }
        return self
    }

}

struct SunnyDay: View {
    @EnvironmentObject private var betModel: BetModel
    
    @State private var isWinnerPresented = false
    @State private var isPausePresented = false
    @State private var isHowToPresented = false
    @State private var stepSpin: SunnyDaysCases = .first
    
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
    
    var body: some View {
        ZStack {
            HStack {
                Group {
                    PauseButton { isPausePresented = true }
//                    Text("potential winning amount: ".uppercased()) +
//                    Text(multiplyNumber, format: .number)
                }
                .textOnBoardStyle
                .padding(.leading)
                Spacer()
                Wallet()
                    .padding(.trailing)
            }
            .alignmentPosition(.top)
            betMultipluy
                .alignmentPosition(.top)
                .padding(.top, 45)
            Image(.SunnyDay.casinoBoard)
                .overlay(alignment: .bottom) {
                    HStack(spacing: -50) {
                        ForEach(Array(SunnyDaysCases.allCases.enumerated()), id: \.offset) { index, step in
                            ZStack {
                                Image(step.score)
                                    .overlay(alignment: .bottom) {
                                        Text(step.coefficient, format: .number)
                                            .font(.dynamo(.regular, size: 14))
                                            .foregroundStyle(.white)
                                            .padding(.bottom, 3)
                                    }
                                    .padding(.top, -63)
                                    .alignmentPosition(.top)
                                nextStep
                                    .padding(.top, -30)
                                    .opacity(step == stepSpin ? 1 : 0)
                                    .opacity(betModel.isGameStarted ? 1 : 0)
                                VStack(spacing: 0) {
                                    SpinItems(stepSpin: $stepSpin) { }
                                    Text(index + 1, format: .number)
                                        .font(.cherryBombOne(.regular, size: 20))
                                        .foregroundStyle(.white)
                                        .shadow(color: .fontShadow, radius: 4, x: 0, y: 4)
                                        .padding(.bottom, -15)
                                }
                            }
                        }
                    }
                    .padding(.bottom, 10)
                }
            BetBoard { isWinnerPresented = true }
                .alignmentPosition(.bottom)
        }.modifier(AppBackground(.SunnyDay.background))
            .pauseSheet(isPresented: $isPausePresented) {
                isPausePresented = false
                isHowToPresented = true
            }
            .howToSheet(isPresented: $isHowToPresented, title: SunnyDay.howToTitle, text: SunnyDay.howToText)
            .fullScreenCover(isPresented: $isWinnerPresented) {
                Winner(background: .SunnyDay.background, winnerCase: .victory)
            }
    }
}

#Preview {
    SunnyDay()
        .environmentObject(Router())
        .environmentObject(DefaultStorage())
        .environmentObject(BetModel())
}

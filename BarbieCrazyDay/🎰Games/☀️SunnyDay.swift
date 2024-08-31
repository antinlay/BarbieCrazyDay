//
//  ☀️SunnyDay.swift
//  BarbieCrazyDay
//
//  Created by Janiece Eleonour on 29.08.2024.
//

import SwiftUI

struct SunnyDay: View {
    @State private var isPausePresented = false
    @State private var isHowToPresented = false
    @State private var multiplyNumber: Double = 0
    
    private var betMultipluy: some View {
        Group {
            Text("x") +
            Text(multiplyNumber, format: .number)
        }
        .font(.cherryBombOne(.regular, size: 50))
        .foregroundColor(.white)
        .strokeText(width: 1, color: .shadowPinkColor)
        .shadow(color: .shadowPinkColor, radius: 1, x: 0, y: 5)
    }


    var body: some View {
        ZStack {
            HStack {
                Group {
                    PauseButton { isPausePresented = true }
                    Text("potential winning amount: ".uppercased()) +
                    Text(multiplyNumber, format: .number)
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
            VStack(spacing: 0) {
                HStack(spacing: -15) {
                    Image(.SunnyDay.bombScore)
                    Image(.SunnyDay.brilliantScore)
                    Image(.SunnyDay.orangeScore)
                    Image(.SunnyDay.emeraldScore)
                    Image(.SunnyDay.loveScore)
                }
                Image(.SunnyDay.casinoBoard)
                    .overlay(alignment: .bottom) {
                        HStack {
                            ForEach(1...5, id: \.self) { number in
                                Text(number, format: .number)
                                    .font(.cherryBombOne(.regular, size: 20))
                                    .foregroundStyle(.white)
                                    .shadow(color: .fontShadow, radius: 4, x: 0, y: 4)
                                    .padding(20)
                            }
                        }
                        .padding(.bottom, 10)
                    }
            }
            BetBoard()
                .alignmentPosition(.bottom)
        }.modifier(AppBackground(.SunnyDay.background))
            .pauseSheet(isPresented: $isPausePresented) {
                isPausePresented = false
                isHowToPresented = true
            }
            .howToSheet(isPresented: $isHowToPresented, title: SunnyDay.howToTitle, text: SunnyDay.howToText)
    }
}

#Preview {
    SunnyDay()
}

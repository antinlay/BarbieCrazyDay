//
//  ⛈️ Thunderstorm.swift
//  BarbieCrazyDay
//
//  Created by Janiece Eleonour on 29.08.2024.
//

import SwiftUI

//final class ThunderstormModel: ObservableObject {
//    @Published
//}

struct Thunderstorm: View {
    @EnvironmentObject private var router: Router
    @EnvironmentObject private var betModel: BetModel
    @State private var isPausePresented = false
    @State private var isHowToPresented = false
    @State private var randomNumber = Double.random(in: 3...100)
    let timer = Timer.publish(every: 0.2, on: .main, in: .common).autoconnect()
    
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
        .pauseSheet(isPresented: $isPausePresented) {
            isPausePresented = false
            isHowToPresented = true
        }
        .howToSheet(isPresented: $isHowToPresented, title: Thunderstorm.howToTitle, text: Thunderstorm.howToText)
        .onReceive(timer) { _ in
            if betModel.isGameStarted && betModel.multiplyNumber < randomNumber {
                betModel.multiplyNumber += 0.1
            } else {
                betModel.multiplyNumber = 0
            }
        }
    }
}

#Preview {
    Thunderstorm()
        .environmentObject(BetModel())
        .environmentObject(Router())
}

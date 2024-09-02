//
//  🤝BetBoard.swift
//  BarbieCrazyDay
//
//  Created by Janiece Eleonour on 29.08.2024.
//

import SwiftUI

struct BetBoard: View {
    @EnvironmentObject private var betModel: BetModel
    @State var actionButtonDisabled = true
    var winner: () -> Void
    
    private var betInfo: some View {
        VStack(spacing: 8) {
            Text("YOUR BET:")
                .font(.cherryBombOne(.regular, size: 20))
            VStack(spacing: 0) {
                Text("MIN BET: ") + Text(betModel.minBet, format: .number)
                Text("MAX BET: ") + Text(betModel.maxBet, format: .number)
            }
            .font(.cherryBombOne(.regular, size: 13))
        }
        .foregroundStyle(.white)
        .shadow(color: .fontShadow, radius: 4, x: 0, y: 4)
    }
    
    private var betTextField: some View {
        Image(.Thunderstorm.textField)
            .overlay(alignment: .trailing) {
                Image(.Thunderstorm.almaz)
                    .offset(x: 12, y: 2)
            }
            .overlay {
                TextField("...", value: $betModel.bet, format: .number)
                    .keyboardType(.decimalPad)
                    .font(.cherryBombOne(.regular, size: 20))
                    .foregroundStyle(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                    .disabled(betModel.isGameStarted)
            }
    }
    
    var body: some View {
        VStack {
            gameDescription
            HStack(alignment: .top, spacing: 15) {
                betInfo
                
                VStack(spacing: 0) {
                    betTextField
                    Group {
                        switch betModel.isGameStarted {
                        case false:
                            dealButton
                        case true:
                            takeButton
                                .disabled(betModel.multiplyNumber == 0)
                                .grayscale(betModel.multiplyNumber == 0 ? 1 : 0)
                        }
                    }
                    .disabled(actionButtonDisabled)
                    .grayscale(actionButtonDisabled ? 1 : .zero)
                }
            }
            .betBoardBackground
            .padding(.horizontal, 24)
        }
        .onChange(of: betModel.bet) { newValue in
            if let newValue = newValue, newValue < betModel.minBet || newValue > betModel.maxBet {
                actionButtonDisabled = true
            } else {
                actionButtonDisabled = false
            }
        }
    }
    
    private var gameDescription: some View {
        Group {
            switch betModel.multiplyNumber == 0 {
            case true:
                Text("place a bet and press deal".uppercased())
            case false:
                Text("your current winnings: ".uppercased()) + Text(betModel.currentWinning, format: .number)
            }
        }
            .textOnBoardStyle
            .shadow(color: .black, radius: 4, x: 0, y: 4)
    }
    
    private var dealButton: some View {
        BetActionButton(actionText: "DEAL") {
            betModel.dealButtonPressed()
        }
    }
    
    private var takeButton: some View {
        BetActionButton(actionText: "TAKE") {
            betModel.takeButtonPressed()
            winner()
        }
    }
    
}

#Preview {
    BetBoard(winner: {
        //
    })
        .environmentObject(BetModel())
}

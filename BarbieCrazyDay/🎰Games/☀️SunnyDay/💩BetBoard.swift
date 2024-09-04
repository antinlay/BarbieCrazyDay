//
//  💩BetBoard.swift
//  BarbieCrazyDay
//
//  Created by Janiece Eleonour on 04.09.2024.
//

import SwiftUI

struct BetBoardSunnyDay: View {
    @Binding var stepSpin: SunnyDayCases
    @Binding var isSpin: Bool
    
    @EnvironmentObject private var betModel: BetModel
    @State var actionButtonDisabled = true
    var winner: () -> Void
    
    private var betInfo: some View {
        VStack(spacing: 0) {
            Text("YOUR BET:")
                .font(.cherryBombOne(.regular, size: 20))
            betTextField
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
        VStack(spacing: -10) {
            HStack(spacing: 23) {
                betInfo
                
                VStack(spacing: 0) {
                    switch betModel.isGameStarted {
                    case false:
                        dealButton
                            .disabled(actionButtonDisabled)
                            .grayscale(actionButtonDisabled ? 1 : .zero)
                    case true:
                        Group {
                            spinButton
                            goButton
                                .disabled(betModel.stepSpin <= stepSpin.step)
                                .grayscale(betModel.stepSpin <= stepSpin.step ? 1 : .zero)
                        }
                            .disabled(isSpin)
                            .grayscale(isSpin ? 1 : .zero)
                    }
                }
            }
            .betBoardBackground
            .padding(.horizontal, 24)
            takeButton
                .disabled(betModel.multiplyNumber == 0)
                .grayscale(betModel.multiplyNumber == 0 ? 1 : .zero)
                .opacity(betModel.isGameStarted ? 1 : .zero)
        }
        .onChange(of: betModel.bet) { newValue in
            if let newValue = newValue, newValue < betModel.minBet || newValue > betModel.maxBet {
                actionButtonDisabled = true
            } else {
                actionButtonDisabled = false
            }
        }
        .onDisappear {
            betModel.reset()
        }
    }
    
    private var dealButton: some View {
        BetDealButton(actionText: "DEAL") {
            betModel.dealButtonPressed()
        }
    }
    
    private var takeButton: some View {
        BetTakeButton {
            betModel.takeButtonPressed()
            winner()
        }
    }
    
    private var spinButton: some View {
        BetSpinButton(actionText: "SPIN \(stepSpin.step)") {
            isSpin = true
        }
    }
    
    private var goButton: some View {
        BetSpinButton(actionText: "GO \(stepSpin.next.step)") {
            if !isSpin {
                stepSpin = stepSpin.next
            }
        }
    }
    
}

#Preview {
    BetBoardSunnyDay(stepSpin: .constant(.first), isSpin: .constant(.random())) {
        //
    }
    .environmentObject(BetModel())
}

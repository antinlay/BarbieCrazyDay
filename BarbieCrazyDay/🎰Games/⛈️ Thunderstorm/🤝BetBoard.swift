//
//  🤝BetBoard.swift
//  BarbieCrazyDay
//
//  Created by Janiece Eleonour on 29.08.2024.
//

import SwiftUI

struct BetBoard: View {
    @State var bet: Int?
    @State var isGameStarted = false
    @State var actionButtonDisabled = false
    @State var descriptionText = "place a bet and press deal".uppercased()
    
    private var betInfo: some View {
        VStack(spacing: 8) {
            Text("YOUR BET:")
                .font(.cherryBombOne(.regular, size: 20))
            VStack(spacing: 0) {
                Text("MIN BET: 1000")
                Text("MAX BET: 10000")
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
                TextField("...", value: $bet, format: .number)
                    .keyboardType(.decimalPad)
                    .font(.cherryBombOne(.regular, size: 20))
                    .foregroundStyle(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                    .disabled(isGameStarted)
            }
    }

    var body: some View {
        VStack {
            Text(descriptionText)
                .textOnBoardStyle
            HStack(alignment: .top, spacing: 15) {
                betInfo
                
                VStack(spacing: 0) {
                    betTextField
                    actionButton
                        .disabled(actionButtonDisabled)
                        .grayscale(actionButtonDisabled ? 1 : .zero)
                }
            }
            .betBoardBackground
            .padding(.horizontal, 24)
        }
    }
    
    private var actionButton: some View {
        Button {
            if isGameStarted {
                takeButtonPressed()
            } else {
                dealButtonPressed()
            }
        } label: {
            Image(.Games.actionButton)
                .overlay(alignment: .top) {
                    Text(isGameStarted ? "TAKE" : "DEAL")
                        .font(.cherryBombOne(.regular, size: 20))
                        .foregroundStyle(.white)
                        .shadow(color: .fontShadow, radius: 4, x: 0, y: 4)
                        .padding(.top, 6)
                }
        }
    }
    
    private func takeButtonPressed() {
        
    }
    
    private func dealButtonPressed() {
        
    }

}

#Preview {
    BetBoard()
}

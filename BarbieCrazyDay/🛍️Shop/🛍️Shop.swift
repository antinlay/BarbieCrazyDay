//
//  🛍️Shop.swift
//  BarbieCrazyDay
//
//  Created by Janiece Eleonour on 27.08.2024.
//

import SwiftUI

struct Shop: View {
    @EnvironmentObject private var router: Router
    @AppStorage(DefaultStorage.Key.wallet.rawValue) private var wallet = 10_000
    @State private var price = 250
    @State private var startGame = false
    @State private var isPayDisabled = false
    
    private var header: some View {
        VStack(alignment: .trailing, spacing: 0) {
            HStack {
                HomeButon(action: {  router.navigate(to: GameViews.menu) })
                .padding(.leading)
                Spacer()
                Wallet()
                    .padding(.trailing)
            }
            TimeBoard()
                .padding(.trailing)
        }
    }
    
    private var chestGameButton: some View {
        Button {
            withAnimation {
                isPayDisabled = true
                startGame = true
                wallet -= price
            }
        } label: {
            Image(.Shop.buyButton)
                .overlay {
                    HStack(spacing: 8) {
                        Text(price, format: .number)
                            .font(.cherryBombOne(.regular, size: 18))
                            .foregroundStyle(.white)
                            .padding(.bottom, 6)
                        Image(.Menu.almaz)
                    }
                }
        }
        .disabled(isPayDisabled)
    }
    
    private var gameBoard: some View {
        Image(.Shop.board)
            .overlay {
                VStack(spacing: 9) {
                    Text("Traveler's Backpack")
                        .font(.cherryBombOne(.regular, size: 20))
                    Text("Pay the entry fee, choose one of three backpacks,\n and win between 100 and 5,000 coins!")
                        .multilineTextAlignment(.center)
                        .font(.cherryBombOne(.regular, size: 13))
                }
                .padding(.bottom, 30)
                .padding(.horizontal)
                .foregroundStyle(.level)
            }
            .overlay(alignment: .bottom) {
                chestGameButton
                    .offset(y: 10)
            }
    }
    
    var body: some View {
        ZStack {
            fullScreenBackground(.Shop.background)
            header
                .alignmentPosition(.top)
            VStack(spacing: 4) {
                Image(.Shop.barbie)
                gameBoard
                    .padding(.top, -75)
                ChestGame(start: $startGame)
                    .frame(maxHeight: 150)
            }
            .alignmentPosition(.bottom)
            .padding(.bottom, 40)
        }
    }
}

#Preview {
    Shop()
        .environmentObject(DefaultStorage())
}

//
//  🛍️Shop.swift
//  BarbieCrazyDay
//
//  Created by Janiece Eleonour on 27.08.2024.
//

import SwiftUI

struct Shop: View {
    @EnvironmentObject private var router: Router
    @State private var wallet = 10000
    @State private var price = 250
    @State private var startGame = false
    
    private var header: some View {
        VStack(alignment: .trailing, spacing: 0) {
            HStack {
                HomeButon(action: {  router.navigate(to: .menu) })
                .padding(.leading)
                Spacer()
                amountMoney(wallet)
                    .padding(.trailing)
            }
            TimeBoard()
                .padding(.trailing)
        }
    }
    
    private var chestGameButton: some View {
        Button {
            withAnimation {
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
        .disabled(startGame)
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
            header
                .alignmentPosition(.top)
            VStack(spacing: 4) {
                Image(.Shop.barbie)
                gameBoard
                    .padding(.top, -75)
                ChestGame(start: startGame)
                    .frame(maxHeight: 150)
            }
            .alignmentPosition(.bottom)
            .padding(.bottom, 40)
        }.modifier(AppBackground(.Shop.background))
    }
}

#Preview {
    Shop()
}

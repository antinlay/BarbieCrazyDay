//
//  🛍️Shop.swift
//  BarbieCrazyDay
//
//  Created by Janiece Eleonour on 27.08.2024.
//

import SwiftUI

struct Shop: View {
    @State private var wallet = 10000
    @State private var price = 250
    
    var body: some View {
        ZStack {
            VStack(alignment: .trailing, spacing: 0) {
                HStack {
                    HomeButon(action: {
                        // to home
                    })
                        .padding(.leading)
                    Spacer()
                    amountMoney(wallet)
                        .padding(.trailing)
                }
                TimeBoard()
                    .padding(.trailing)
                Image(.Shop.barbie)
            }
            .alignmentPosition(.top)
            VStack(spacing: 4) {
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
                        Button {
                            
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
                        .offset(y: 10)
                    }
                HStack {
                    Image(.Shop.chest1)
                    Image(.Shop.chest2)
                        .padding(.bottom, 30)
                    Image(.Shop.chest3)
                }
            }
                .alignmentPosition(.bottom)
                .padding(.horizontal)

        }.modifier(AppBackground(.Shop.background))
    }
}

#Preview {
    Shop()
}

//
//  💠GameMenu.swift
//  BarbieCrazyDay
//
//  Created by Janiece Eleonour on 24.08.2024.
//

import SwiftUI

struct GameMenu: View {
    @EnvironmentObject private var router: Router
    @State private var wallet: Int = 10000
    @State private var levelModel = Level.levelOne.value
                
    var body: some View {
        ZStack {
            VStack(alignment: .trailing) {
                HStack {
                    InfoButton(action: { router.navigate(to: .info) })
                        .padding(.leading)
                    Spacer()
                    amountMoney(wallet)
                        .padding(.trailing)
                }
                TimeBoard()
                    .padding(.trailing)
            }
            .padding(.top, -16)
            .modifier(AlignmentPosition(.topLeading))
            barbie
            HStack(alignment: .bottom) {
                Button {
                    router.navigate(to: .quests)
                } label: {
                    Image(.Menu.questButton)
                }
                .padding(.bottom, -90)
                Spacer()
                VStack(alignment: .trailing, spacing: 0) {
                    Button {
                        router.navigate(to: .shop)
                    } label: {
                        Image(.Menu.shopButton)
                    }
                    .padding(.trailing, 10)
                    Button {
                        router.navigate(to: .shop)
                    } label: {
                        Image(.Menu.gamesButton)
                            .overlay(alignment: .bottom) {
                                Image(.Menu.goButton)
                                    .padding(.bottom, -16)
                            }
                    }
                }
            }
            .padding(.horizontal, 24)
            .padding(.bottom, -100)
            levelBoard
        }.modifier(AppBackground(.Menu.background))
    }
    
    private var levelBoard: some View {
        LevelBoard(levelModel: levelModel, isMenuMode: true)
            .alignmentPosition(.bottomLeading)
            .padding(.leading)
    }
        
    private var barbie: some View {
        Image(.Menu.barbie)
            .scaleEffect(1.04)
            .modifier(AlignmentPosition(.bottomLeading))
    }
}

#Preview {
    GameMenu()
        .environmentObject(Router())
}

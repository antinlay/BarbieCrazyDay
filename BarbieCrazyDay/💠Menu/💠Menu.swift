//
//  💠GameMenu.swift
//  BarbieCrazyDay
//
//  Created by Janiece Eleonour on 24.08.2024.
//

import SwiftUI

struct GameMenu: View {
    @EnvironmentObject private var router: Router
    @EnvironmentObject private var defaultStorage: DefaultStorage
                
    var body: some View {
        ZStack {
            barbie
            levelBoard
            VStack(alignment: .trailing) {
                HStack {
                    InfoButton(action: { router.navigate(to: GameViews.info) })
                        .padding(.leading)
                    Spacer()
                    Wallet()
                        .padding(.trailing)
                }
                TimeBoard()
                    .padding(.trailing)
            }
            .modifier(AlignmentPosition(.topLeading))
            HStack(alignment: .bottom) {
                Button {
                    router.navigate(to: GameViews.quests)
                } label: {
                    Image(.Menu.questButton)
                }
                .padding(.bottom, -90)
                Spacer()
                VStack(alignment: .trailing, spacing: 0) {
                    Button {
                        router.navigate(to: GameViews.shop)
                    } label: {
                        Image(.Menu.shopButton)
                    }
                    .padding(.trailing, 10)
                    Button {
                        router.navigate(to: GameViews.games)
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
        }.modifier(AppBackground(.Menu.background))
    }
    
    private var levelBoard: some View {
        LevelBoard(level: defaultStorage.level, isMenuMode: true)
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
        .environmentObject(DefaultStorage())
}

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
            fullScreenBackground(.Welcome.background)
            barbie
            VStack {
                VStack(alignment: .trailing) {
                    HStack {
                        InfoButton { router.navigate(to: GameViews.info) }
                            .padding(.leading)
                        Spacer()
                        Wallet()
                            .padding(.trailing)
                    }
                    TimeBoard()
                        .padding(.trailing)
                }
                Spacer()
                HStack(alignment: .bottom) {
                    Button {
                        router.navigate(to: GameViews.quests)
                    } label: {
                        Image(.Menu.questButton)
                    }
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
                        .padding(.bottom, 90)
                    }
                }
                .padding(.horizontal, 24)
                levelBoard
            }
        }
    }
    
    private var levelBoard: some View {
        LevelBoard(level: defaultStorage.level, isMenuMode: true)
            .padding(.leading)
    }
        
    private var barbie: some View {
        Image(.Menu.barbie)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .alignmentPosition(.bottomLeading)
    }
}

#Preview {
    GameMenu()
        .environmentObject(Router())
        .environmentObject(DefaultStorage())
}

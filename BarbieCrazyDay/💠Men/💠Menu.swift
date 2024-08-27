//
//  💠Menu.swift
//  BarbieCrazyDay
//
//  Created by Janiece Eleonour on 24.08.2024.
//

import SwiftUI

struct Menu: View {
    @State private var wallet: Int = 10000
    @State private var levelModel = Level.levelOne.value
                
    var body: some View {
        ZStack {
            VStack(alignment: .trailing) {
                HStack {
                    InfoButton(action: {
                        // navigate to Info
                    })
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
                    // quests view
                } label: {
                    Image(.Menu.questButton)
                }
                .padding(.bottom, -90)
                Spacer()
                VStack(alignment: .trailing, spacing: 0) {
                    Button {
                        // shop view
                    } label: {
                        Image(.Menu.shopButton)
                    }
                    .padding(.trailing, 10)
                    Button {
                        // games view
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
    Menu()
}

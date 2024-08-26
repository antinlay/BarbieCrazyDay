//
//  ℹ️Info.swift
//  BarbieCrazyDay
//
//  Created by Janiece Eleonour on 26.08.2024.
//

import SwiftUI

enum QuestStatus {
    case done
    case now
    case next
    
    var value: ImageResource {
        switch self {
        case .done:
                .Info.done
        case .now:
                .Info.now
        case .next:
                .Info.next
        }
    }
}

enum Gift: CaseIterable {
    case questOne, questTwo, questThree, questFour, questFive, questSix, questSeven, questEight, questNine, questTen
    
    var value: ImageResource {
        switch self {
        case .questOne:
                .Info.quest1
        case .questTwo:
                .Info.quest2
        case .questThree:
                .Info.quest3
        case .questFour:
                .Info.quest4
        case .questFive:
                .Info.quest5
        case .questSix:
                .Info.quest6
        case .questSeven:
                .Info.quest7
        case .questEight:
                .Info.quest8
        case .questNine:
                .Info.quest9
        case .questTen:
                .Info.quest10
        }
    }
}

struct QuestContainer: View {
    var gift: Gift
    var index: Int
    var status: QuestStatus
    
    private var quest: some View {
        VStack(spacing: -10) {
            Text("\(index + 1)")
                .font(.cherryBombOne(.regular, size: 33))
            Text("QUEST")
                .font(.cherryBombOne(.regular, size: 25))
        }
    }
        
    var body: some View {
        VStack {
            Spacer()
            Image(.Info.holder)
                .overlay(alignment: .topTrailing) {
                    Image(status.value).offset(x: 6, y: 6)
                }
                .overlay(alignment: .topLeading) {
                    Image(gift.value).offset(x: -16, y: -8)
                }
                .overlay(alignment: .top) {
                    quest
                    .foregroundStyle(.white)
                    .shadow(color: .fontShadow, radius: 4, x: 0, y: 4)
                    .padding(.top, 10)
                }
        }
        .padding(.bottom, (index) % 2 == 0 ? 10 : -10)
    }
}

struct LevelInfo: View {
    @State private var wallet: Int = 10000
    
    let giftArray = Array(Gift.allCases.enumerated())
    
    private var amountMoney: some View {
        Image(.Menu.amount)
            .overlay {
                HStack(spacing: 4) {
                    Text("\(wallet)")
                        .font(.cherryBombOne(.regular, size: 15))
                        .foregroundStyle(.accent)
                        .shadow(color: .fontShadow, radius: 4, x: 0, y: 4)
                    Image(.Menu.almaz)
                }
            }
    }
    
    private var homeButton: some View {
        Button {
            // navigate to home
        } label: {
            Image(.Info.homeButton)
        }
    }
    
    var body: some View {
        ScrollView {
            ZStack {
                VStack {
                    HStack {
                        homeButton
                            .padding(.leading)
                        Spacer()
                        amountMoney
                            .padding(.trailing)
                    }
                    
                    LazyVGrid(columns: [GridItem(.fixed(160)), GridItem(.fixed(160))], spacing: 0){
                        ForEach(giftArray, id: \.offset) { index, gift in
                            QuestContainer(gift: gift, index: index, status: .next)
                        }
                    }
                }
            }
        }.modifier(AppBackground(.Info.background))
    }
}

#Preview {
    LevelInfo()
}

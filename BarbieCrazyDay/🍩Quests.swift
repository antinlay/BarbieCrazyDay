//
//  🍩Quests.swift
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
                .Quests.done
        case .now:
                .Quests.now
        case .next:
                .Quests.next
        }
    }
}

enum Gift: CaseIterable {
    case questOne, questTwo, questThree, questFour, questFive, questSix, questSeven, questEight, questNine, questTen
    
    var value: ImageResource {
        switch self {
        case .questOne:
                .Quests.quest1
        case .questTwo:
                .Quests.quest2
        case .questThree:
                .Quests.quest3
        case .questFour:
                .Quests.quest4
        case .questFive:
                .Quests.quest5
        case .questSix:
                .Quests.quest6
        case .questSeven:
                .Quests.quest7
        case .questEight:
                .Quests.quest8
        case .questNine:
                .Quests.quest9
        case .questTen:
                .Quests.quest10
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
            Image(.Quests.holder)
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

struct Quests: View {
    let giftArray = Array(Gift.allCases.enumerated())
    
    @State private var wallet: Int = 10000
    
    var body: some View {
        ScrollView {
            ZStack {
                VStack {
                    HStack {
                        HomeButon(action: {
                            // navigate to home view
                        })
                            .padding(.leading)
                        Spacer()
                        amountMoney(wallet)
                            .padding(.trailing)
                    }
                    
                    LazyVGrid(columns: [GridItem(.fixed(160)), GridItem(.fixed(160))], spacing: 0){
                        ForEach(giftArray, id: \.offset) { index, gift in
                            QuestContainer(gift: gift, index: index, status: .next)
                        }
                    }
                }
            }
        }.modifier(AppBackground(.Quests.background))
    }
}

#Preview {
    Quests()
}

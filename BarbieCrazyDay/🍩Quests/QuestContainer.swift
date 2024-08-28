//
//  QuestContainer.swift
//  BarbieCrazyDay
//
//  Created by Janiece Eleonour on 28.08.2024.
//

import SwiftUI

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

#Preview {
    QuestContainer(gift: .questOne, index: 1, status: .now)
}

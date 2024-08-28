//
//  🍩Quests.swift
//  BarbieCrazyDay
//
//  Created by Janiece Eleonour on 26.08.2024.
//

import SwiftUI

struct Quests: View {
    @EnvironmentObject private var router: Router
    @AppStorage(DefaultStorage.Key.complete.rawValue) private var questsComlete = 0
    
    let giftArray = Array(Gift.allCases.enumerated())
    
    private func questStatus(_ index: Int) -> QuestStatus {
        if index <= questsComlete {
            return .done
        } else if index == questsComlete + 1 {
            return .now
        } else {
            return .next
        }
    }
        
    var body: some View {
        NavigationStack {
            ScrollView {
                ZStack {
                    VStack {
                        HStack {
                            HomeButon { router.navigate(to: GameViews.menu) }
                                .padding(.leading)
                            Spacer()
                            Wallet()
                                .padding(.trailing)
                        }
                        
                        LazyVGrid(columns: [GridItem(.fixed(160)), GridItem(.fixed(160))], spacing: 0) {
                            ForEach(giftArray, id: \.offset) { index, gift in
                                NavigationLink {
                                    gift.story.view
                                } label: {
                                    QuestContainer(gift: gift, index: index, status: questStatus(index))
                                }
                                .disabled(index > questsComlete)
                            }
                        }
                    }
                }
            }.modifier(AppBackground(.Quests.background))
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    Quests()
        .environmentObject(Router())
}

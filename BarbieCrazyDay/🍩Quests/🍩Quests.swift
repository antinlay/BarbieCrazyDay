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
        if index < questsComlete {
            .done
        } else if index == questsComlete {
            .now
        } else {
            .next
        }
    }
    
    var body: some View {
        NavigationStack {
                ZStack {
                    fullScreenBackground(.Quests.background)
                    ScrollView {
                    VStack {
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
                    .padding(.top, 70)
                }
                    HStack {
                        HomeButon { router.navigate(to: GameViews.menu) }
                            .padding(.leading)
                        Spacer()
                        Wallet()
                            .padding(.trailing)
                    }.alignmentPosition(.top)
            }
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    Quests()
        .environmentObject(Router())
}

//
//  StoryResult.swift
//  BarbieCrazyDay
//
//  Created by Janiece Eleonour on 28.08.2024.
//

import SwiftUI

struct StoryResult: View {
    @EnvironmentObject private var router: Router
    @EnvironmentObject private var defaultStorage: DefaultStorage
    var selectedOption: (key: String, value: String)
    var storyModel: StoryModel
    
    @ViewBuilder private var goodJob: some View {
        Image(storyModel.gift)
            .padding(.trailing, -40)
            .alignmentPosition(.topTrailing)
        VStack(alignment: .trailing) {
            Text(selectedOption.value)
                .textOnBoardStyle
                .boardBackground
                .padding(.horizontal)
            Image(.Stories.greatJob)
                .overlay {
                    VStack(spacing: -4) {
                        VStack(spacing: -10) {
                            Text("Great job!".uppercased())
                            Text("You nailed it!".uppercased())
                        }
                        .multilineTextAlignment(.center)
                        .font(.cherryBombOne(.regular, size: 20))
                        HStack {
                            Text(storyModel.reward, format: .number)
                                .font(.cherryBombOne(.regular, size: 30))
                                .padding(.bottom, 8)
                            Image(.Stories.almaz)
                        }
                    }
                    .foregroundStyle(.level)
                }
        }
        .padding(.top, 100)
        .alignmentPosition(.top)
        Image(.Stories.barbie)
            .alignmentPosition(.bottomLeading).ignoresSafeArea()
            .onAppear {
                levelUp()
            }
    }
    
    var body: some View {
        let isRightOption = selectedOption.key.hasPrefix(storyModel.trueOption)
        
        ZStack {
            switch isRightOption {
            case true:
                goodJob
            case false:
                niceTry
                    .alignmentPosition(.top)
                    .padding(.top, 61)
            }
            LongHomeButon { router.navigate(to: .menu) }
                .alignmentPosition(.bottomTrailing)
                .padding(.trailing)
        }
        .modifier(AppBackground(storyModel.background))
        .navigationBarBackButtonHidden()
    }
    
    private func levelUp() {
        defaultStorage.wallet += defaultStorage.level <= Int(storyModel.reward/1000) ? storyModel.reward : 0
        defaultStorage.level = max(Int(storyModel.reward/1000) + 1, defaultStorage.level)
        defaultStorage.completedQuests = max(Int(storyModel.reward/1000) + 1, defaultStorage.completedQuests)
    }
    
    private var niceTry: some View {
        VStack {
            Image(.Stories.niceTry)
            Text(selectedOption.value)
                .padding(5)
                .textOnBoardStyle
                .boardBackground
                .padding(.horizontal)
        }
    }
}

#Preview {
    StoryResult(selectedOption: Story.firstStory.options.first!, storyModel: Story.firstStory)
        .environmentObject(DefaultStorage())
        .environmentObject(Router())
}

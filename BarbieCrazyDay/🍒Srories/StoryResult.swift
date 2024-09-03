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
        VStack(alignment: .trailing) {
            Image(storyModel.gift)
                .padding(.trailing, -40)
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
            .padding(.top, -100)
            Spacer()
            LongHomeButon { router.navigate(to: .menu) }
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(.trailing)
        }
        .onAppear {
            levelUp()
        }
    }
    
    var body: some View {
        let isRightOption = selectedOption.key.hasPrefix(storyModel.trueOption)
        
        ZStack {
            fullScreenBackground(storyModel.background)
            switch isRightOption {
            case true:
                Image(.Stories.barbie)
                    .alignmentPosition(.bottomLeading).ignoresSafeArea()
                goodJob
            case false:
                niceTry
                    .alignmentPosition(.top)
                    .padding(.top, 61)
            }
        }
        .navigationBarBackButtonHidden()
    }
    
    private func levelUp() {
        defaultStorage.wallet += defaultStorage.level <= Int(storyModel.reward/1000) ? storyModel.reward : 0
        defaultStorage.level = max(Int(storyModel.reward/1000) + 1, defaultStorage.level)
        defaultStorage.completedQuests = max(Int(storyModel.reward/1000), defaultStorage.completedQuests)
    }
    
    private var niceTry: some View {
        VStack {
            Image(.Stories.niceTry)
            ScrollView {
                Text(selectedOption.value)
                    .padding(5)
            }
            .textOnBoardStyle
            .boardBackground
            .padding(.horizontal)
            Spacer()
            LongHomeButon { router.navigate(to: .menu) }
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(.trailing)
        }
    }
}

#Preview {
    StoryResult(selectedOption: Story.firstStory.options.first!, storyModel: Story.firstStory)
        .environmentObject(DefaultStorage())
        .environmentObject(Router())
}

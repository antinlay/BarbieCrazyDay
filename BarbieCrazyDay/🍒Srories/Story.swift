//
//  Story.swift
//  BarbieCrazyDay
//
//  Created by Janiece Eleonour on 28.08.2024.
//

import SwiftUI

struct Story: View {
    @EnvironmentObject private var router: Router
    var storyModel: StoryModel
    @State private var selectedTab = 0
    @State private var isShowingOptions = false
    @State private var selectedOption: (key: String, value: String) = (key: "", value: "")
    @State private var isPausePresented = false
    
    private var preGameStory: some View {
        TabView(selection: $selectedTab) {
            ForEach(storyModel.text.indices, id: \.self) { index in
                VStack {
                    ScrollView(showsIndicators: false) {
                        Text(storyModel.title.uppercased())
                            .font(.cherryBombOne(.regular, size: 25))
                            .foregroundColor(.accent)
                            .padding(.bottom, 5)
                        Text(storyModel.text[index]).tag(index)
                            .textOnBoardStyle
                        if index == 0 {
                            Image(storyModel.gift)
                        }
                    }
                    .padding(.horizontal, 10)
                }
                .alignmentPosition(.top)                
            }
        }
        .boardBackground
        .padding(.horizontal, 15)
        .padding(.top, 100)
        .padding(.bottom, 70)
        .tabViewStyle(.page(indexDisplayMode: .always))
    }
    
    var body: some View {
        ZStack {
            switch isShowingOptions {
            case true:
                gameStory
                lady
                ChooseOneButton {
                    withAnimation {
                        selectedOption = storyModel.options.randomElement()!
                    }
                }
                .alignmentPosition(.top)
                .padding(.top, 2)
                NavigationLink {
                    StoryResult(selectedOption: selectedOption, storyModel: storyModel)
                } label: {
                    Image(.Stories.continueButton)
                }
                .disabled(selectedOption.key.isEmpty)
                .alignmentPosition(.bottomTrailing)
                .padding(.trailing)
            case false:
                preGameStory
                ContinueButton {
                    withAnimation {
                        isShowingOptions = true
                    }
                }
                .alignmentPosition(.bottomTrailing)
                .padding(.trailing)
                .opacity(selectedTab == storyModel.text.count - 1 ? 1 : 0)
            }
            PauseButton { isPausePresented = true }
                .alignmentPosition(.topLeading)
                .padding(.leading)
            
        }
        .modifier(AppBackground(storyModel.background))
        .fullScreenCover(isPresented: $isPausePresented) {
                pauseSheet
                    .presentationBackground(.ultraThinMaterial)
        }
        .navigationBarBackButtonHidden()
    }
    
    private var pauseSheet: some View {
        VStack(spacing: -65) {
            Image(.Thunderstorm.candyBall)
            VStack(spacing: 5) {
                SheetContinueButton {
                    isPausePresented = false
                }
                SheetHomeButton {
                    router.navigate(to: .menu)
                }
            }
        }
    }
    
    private var gameStory: some View {
        VStack {
            ForEach(storyModel.options.keys.sorted(), id: \.self) { option in
                Text(option)
                    .padding(.horizontal, 10)
                    .textOnBoardStyle
                    .boardBackground
                    .padding(.horizontal, 20)
                    .padding(.bottom, 10)
                    .scaleEffect(selectedOption.key == option ? 1.05 : 1)
                    .onTapGesture {
                        withAnimation {
                            selectedOption = (key: option, value: storyModel.options[option] ?? "")
                        }
                    }
            }
        }.alignmentPosition(.top)
            .padding(.top, 60)
    }
    
    private var lady: some View {
        Image(.Stories.lady).alignmentPosition(.bottomLeading).ignoresSafeArea()
    }
    
}

#Preview {
    GameViews.StoryCase.first.view
}

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
                            .multilineTextAlignment(.center)
                            .padding(.bottom, 5)
                        Text(storyModel.text[index]).tag(index)
                            .textOnBoardStyle
                        if index == 0 {
                            Image(storyModel.gift)
                        }
                    }
                    .padding(.horizontal, 10)
                }
            }
        }
        .boardBackground
        .padding(.horizontal, 15)
        .padding(.top)
        .padding(.bottom)
        .tabViewStyle(.page(indexDisplayMode: .always))
    }
    
    var body: some View {
        ZStack {
            fullScreenBackground(storyModel.background)
            switch isShowingOptions {
            case true:
                VStack {
                    ZStack {
                        PauseButton { isPausePresented = true }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading)
                        ChooseOneButton {
                            withAnimation {
                                selectedOption = storyModel.options.randomElement()!
                            }
                        }
                    }
                    .padding(.bottom)

                    gameStory
                    ZStack(alignment: .bottomTrailing) {
                        lady
                        NavigationLink {
                            StoryResult(selectedOption: selectedOption, storyModel: storyModel)
                        } label: {
                            Image(.Stories.continueButton)
                        }
                        .disabled(selectedOption.key.isEmpty)
                        .padding()
                    }
                }.ignoresSafeArea(edges: .bottom)
                
            case false:
                VStack {
                    PauseButton { isPausePresented = true }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading)
                    preGameStory
                    ContinueButton {
                        withAnimation {
                            isShowingOptions = true
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .trailing)
                                        .padding(.trailing)
                    .opacity(selectedTab == storyModel.text.count - 1 ? 1 : 0)
                }
            }
            
        }
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
                ScrollView {
                    Text(option)
                        .padding(.horizontal, 10)
                        .textOnBoardStyle
                }
                .boardBackground
                .padding(.horizontal, 20)
                .padding(.bottom, 2)
                .scaleEffect(selectedOption.key == option ? 1.05 : 1)
                .onTapGesture {
                    withAnimation {
                        selectedOption = (key: option, value: storyModel.options[option] ?? "")
                    }
                }
            }
        }
    }
    
    private var lady: some View {
        Image(.Stories.lady)
            .resizable()
            .aspectRatio(contentMode: .fit)
    }
    
}

#Preview {
    GameViews.StoryCase.first.view
}

//
//  Router.swift
//  BarbieCrazyDay
//
//  Created by Janiece Eleonour on 27.08.2024.
//

import SwiftUI

enum GameViews {
    case welcome, menu, quests, games, shop, thundershtorm, mountains, sunnyDay, levels, info
    
    @ViewBuilder var view: some View {
        switch self {
        case .welcome:
            Welcome()
        case .menu:
            GameMenu()
        case .quests:
            Quests()
        case .games:
            GameMenu()
        case .shop:
            Shop()
        case .thundershtorm:
            GameMenu()

        case .mountains:
            GameMenu()

        case .sunnyDay:
            GameMenu()
        case .levels:
            Levels()
        case .info:
            Info()
        }
    }
    
    enum StoryCase: CaseIterable {
        case first, second, third, fourth, fifth, sixth, seventh, eighth, ninth, tenth
        
        @ViewBuilder var view: some View {
            switch self {
            case .first:
                Story(storyModel: Story.firstStory)
            case .second:
                Story(storyModel: Story.secondStory)
            case .third:
                Story(storyModel: Story.thirdStory)
            case .fourth:
                Story(storyModel: Story.fourthStory)
            case .fifth:
                Story(storyModel: Story.fifthStory)
            case .sixth:
                Story(storyModel: Story.sixthStory)
            case .seventh:
                Story(storyModel: Story.seventhStory)
            case .eighth:
                Story(storyModel: Story.eighthStory)
            case .ninth:
                Story(storyModel: Story.ninthStory)
            case .tenth:
                Story(storyModel: Story.tenthStory)
            }
        }
    }
}


final class Router: ObservableObject {
    @Published var current: GameViews = .menu
    
    func navigate(to view: GameViews) {
        current = view
    }
}

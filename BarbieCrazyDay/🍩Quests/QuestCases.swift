//
//  QuestCases.swift
//  BarbieCrazyDay
//
//  Created by Janiece Eleonour on 28.08.2024.
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
    
    var story: GameViews.StoryCase {
        switch self {
        case .questOne:
                .first
        case .questTwo:
                .second
        case .questThree:
                .third
        case .questFour:
                .fourth
        case .questFive:
                .fifth
        case .questSix:
                .sixth
        case .questSeven:
                .seventh
        case .questEight:
                .eighth
        case .questNine:
                .ninth
        case .questTen:
                .tenth
        }
    }
}

//
//  DiificultyLevel.swift
//  BarbieCrazyDay
//
//  Created by Janiece Eleonour on 31.08.2024.
//

import SwiftUI

enum DifficultyLevelCases: CaseIterable {
    case easy, hard, crazy
    
    var info: ImageResource {
        switch self {
        case .easy:
                .Mountains.easyLevel
        case .hard:
                .Mountains.hardLevel
        case .crazy:
                .Mountains.crazyLevel
        }
    }
    
    var button: ImageResource {
        switch self {
        case .easy:
                .Mountains.easyButton
        case .hard:
                .Mountains.hardButton
        case .crazy:
                .Mountains.crazyButton
        }
    }
    
    var coefficient: [Double] {
        switch self {
        case .easy:
            [7.21, 5.63, 4.4, 3.44, 2.68, 2.10, 1.64, 1.28]
        case .hard:
            [184.68, 96.19, 50.1, 26.09, 13.58, 7.08, 3.69, 1.92]
        case .crazy:
            [47276.99, 12311.72, 3206.18, 834.94, 217.43, 56.62, 14.62, 3.84]
        }
    }
    
    var items: Array<ImageResource> {
        let allItems: [ImageResource] = [.SunnyDay.brilliant, .SunnyDay.emerald, .SunnyDay.love, .SunnyDay.orange, .SunnyDay.rainbow].shuffled()
        var items = allItems.prefix(3)
        items.append(.Mountains.bomb)

        switch self {
        case .easy:
            return items.shuffled()
        case .hard:
            return [allItems.randomElement()!, .Mountains.bomb].shuffled()
        case .crazy:
            return items.shuffled()
        }
    }
}

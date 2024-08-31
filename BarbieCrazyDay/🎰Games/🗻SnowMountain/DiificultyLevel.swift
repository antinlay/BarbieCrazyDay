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
            [1.28, 1.64, 2.10, 2.68, 3.44, 4.4, 5.63, 7.21]
        case .hard:
            [1.92, 3.69, 7.08, 13.58, 26.09, 50.1, 96.19, 184.68]
        case .crazy:
            [3.84, 14.62, 56.62, 217.43, 834.94, 3206.18, 12311.72, 47276.99]
        }
    }
    
    var items: Array<ImageResource> {
        let allItems: [ImageResource] = [.SunnyDay.brilliant, .SunnyDay.emerald, .SunnyDay.love, .SunnyDay.orange, .SunnyDay.rainbow].shuffled()
        var items = allItems.prefix(3)
        items.append(.SunnyDay.bomb)

        switch self {
        case .easy:
            return items.shuffled()
        case .hard:
            return [allItems.randomElement()!, .SunnyDay.bomb].shuffled()
        case .crazy:
            return items.shuffled()
        }
    }
}

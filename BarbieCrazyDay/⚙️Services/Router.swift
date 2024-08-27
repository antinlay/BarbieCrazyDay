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
}

final class Router: ObservableObject {
    @Published var current: GameViews = .menu
    
    func navigate(to view: GameViews) {
        current = view
    }
}

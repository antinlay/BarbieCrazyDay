//
//  Router.swift
//  BarbieCrazyDay
//
//  Created by Janiece Eleonour on 27.08.2024.
//

import Foundation

enum GameViews {
    case welcome, menu, games, shop, thundershtorm, mountains, sunnyDay
}

final class Router: ObservableObject {
    @Published var currentView: GameViews = .menu
    
    func navigate(to view: GameViews) {
        currentView = view
    }
}

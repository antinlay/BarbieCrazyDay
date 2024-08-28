//
//  ContentView.swift
//  BarbieCrazyDay
//
//  Created by Janiece Eleonour on 23.08.2024.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var router: Router
    @EnvironmentObject private var defaultStorage: DefaultStorage
    
    var body: some View {
        Group {
            switch defaultStorage.isWelcomeShowed {
            case false:
                Welcome()
            case true:
                router.current.view
            }
        }
        .animation(.interpolatingSpring, value: router.current)
    }
}

#Preview {
    ContentView()
        .environmentObject(Router())
}

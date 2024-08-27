//
//  BarbieCrazyDayApp.swift
//  BarbieCrazyDay
//
//  Created by Janiece Eleonour on 23.08.2024.
//

import SwiftUI

@main
struct BarbieCrazyDayApp: App {
    @StateObject private var router = Router()
    @StateObject private var defaultStorage = DefaultStorage()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(router)
                .environmentObject(defaultStorage)
        }
    }
}

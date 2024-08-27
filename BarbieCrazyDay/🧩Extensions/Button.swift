//
//  Button.swift
//  BarbieCrazyDay
//
//  Created by Janiece Eleonour on 27.08.2024.
//

import SwiftUI

public struct HomeButon: View {
    var action: () -> Void
    
    public var body: some View {
        Button(action: action) { Image(.Quests.homeButton) }
    }
}

public struct InfoButton: View {
    var action: () -> Void
    
    public var body: some View {
        Button(action: action) { Image(.Menu.info) }
    }
}

//
//  👋🏼Welcome.swift
//  BarbieCrazyDay
//
//  Created by Janiece Eleonour on 23.08.2024.
//

import SwiftUI

struct Welcome: View {
    @EnvironmentObject private var defaultStorage: DefaultStorage
    @EnvironmentObject private var router: Router
    
    let step = """
                Step into a world where each step leads you on an
                epic journey filled with thrilling challenges,
                mysterious artifacts, and dynamic weather-themed
                games. Ready to test your luck and strategy? Join
                us for an unforgettable adventure where every
                choice matters and every game is a new quest.
                Let's play and make today legendary!
               """
    let remember = """
                    Remember, it's all in good fun — no real money
                    involved. Let the whimsy and a touch of strategic
                    mischief guide you through this
                    laughter-serious epic!
                   """
    
    private var cloudHi: some View {
        Image(.Welcome.cloud)
            .overlay(alignment: .top) {
                Group {
                    VStack(spacing: -10) {
                        Text("HI!")
                            .font(.cherryBombOne(.regular, size: 50))
                            .foregroundStyle(.accent)
                        Text("My name is\nAyna!")
                            .font(.cherryBombOne(.regular, size: 16))
                            .multilineTextAlignment(.center)
                            .foregroundStyle(.white)
                    }
                }
                .rotationEffect(.degrees(-15))
                .shadow(color: .black, radius: 4, x: 0, y: 4)
            }
            .modifier(AlignmentPosition(.topTrailing))
            .padding(.top, 165)
            .padding(.trailing, 20)
    }
    
    private var startButton: some View {
        Button {
            defaultStorage.isWelcomeShowed = true
            router.navigate(to: .menu)
        } label: {
            Image(.Welcome.start)
        }
    }
    
    var body: some View {
        ZStack {
            Image(.Welcome.barbie)
                .modifier(AlignmentPosition(.bottomLeading))
            cloudHi
            VStack {
                stepDescription
                rememberDescription
                startButton
            }.modifier(AlignmentPosition(.bottom))
                .padding(.bottom, 44)
        }.modifier(AppBackground(.Welcome.background))
    }
    
    private var stepDescription: some View {
        Image(.Welcome.step)
            .overlay {
                Text(step)
                    .font(.cherryBombOne(.regular, size: 13))
                    .foregroundStyle(.white)
                    .multilineTextAlignment(.center)
                    .shadow(color: .black, radius: 4, x: 0, y: 4)
            }
    }
    
    private var rememberDescription: some View {
        Image(.Welcome.remember)
            .overlay {
                Text(remember)
                    .font(.cherryBombOne(.regular, size: 13))
                    .foregroundStyle(.white)
                    .multilineTextAlignment(.center)
                    .shadow(color: .black, radius: 4, x: 0, y: 4)
            }
    }
}

#Preview {
    Welcome()
}

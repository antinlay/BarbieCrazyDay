//
//  👋🏼Welcome.swift
//  BarbieCrazyDay
//
//  Created by Janiece Eleonour on 23.08.2024.
//

import SwiftUI

struct Welcome: View {
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
    
    var body: some View {
        ZStack {
            Image(.Welcome.barbie)
                .modifier(AlignmentPosition(.bottomLeading))
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
            VStack {
                Image(.Welcome.step)
                    .overlay {
                        Text(step)
                            .font(.cherryBombOne(.regular, size: 13))
                            .foregroundStyle(.white)
                            .multilineTextAlignment(.center)
                    }
                Image(.Welcome.remember)
                    .overlay {
                        Text(remember)
                            .font(.cherryBombOne(.regular, size: 13))
                            .foregroundStyle(.white)
                            .multilineTextAlignment(.center)
                    }
                Image(.Welcome.start)
            }.modifier(AlignmentPosition(.bottom))
                .padding(.bottom, 44)
        }.modifier(AppBackground(.Welcome.background))
    }
}

#Preview {
    Welcome()
}

//
//  🎚️Levels.swift
//  BarbieCrazyDay
//
//  Created by Janiece Eleonour on 27.08.2024.
//

import SwiftUI

struct LevelBoard: View {
    @State var level: Int
    @State private var confirmed: Bool = false
    @EnvironmentObject private var router: Router
    @EnvironmentObject private var defaultStorage: DefaultStorage
    var isMenuMode: Bool? = false
    
    @ViewBuilder private func textRichText(first: String, last: String) -> some View {
        let confirmedImage: ImageResource = confirmed ? .Levels.on : .Levels.off
        
        HStack {
            Image(confirmedImage)
            Text(first) +
            Text(Double(level) * 1.5, format: .number) +
            Text(last)
        }.font(.cherryBombOne(.regular, size: 12))

    }
    
    @ViewBuilder private var plusBoard: some View {
        let confirmedImage: ImageResource = confirmed ? .Levels.done : .Levels.next
        
        Image(.Levels.plusBoard)
            .offset(y: -5)
            .overlay(alignment: .topTrailing) {
                HStack(spacing: 4) {
                    Text("+") +
                    Text(level * 1000, format: .number)
                    Image(.Levels.almaz)
                }
                    .font(.cherryBombOne(.regular, size: 15))
                    .foregroundStyle(.white)
                    .padding(.top, 4)
            }
            .overlay(alignment: .bottom) {
                Image(confirmedImage)
                    .padding(.bottom, 12)
            }

    }
    
    private var questionButton: some View {
        Button {
            router.navigate(to: GameViews.levels)
        } label: {
            Image(.Menu.question)
                .offset(x: -6, y: -15)
        }
    }
    
    var body: some View {
        Image(.Levels.levelBoard)
            .overlay(alignment: .topLeading) {
                VStack(spacing: 0) {
                    Text("YOUR LEVEL: \(level)")
                        .font(.cherryBombOne(.regular, size: 20))
                        .padding(.top)
                        .padding(.leading, 46)
                    VStack(alignment: .leading, spacing: -8) {
                        textRichText(first: "Reach x", last: " in Snow Mountains")
                        textRichText(first: "Win a x", last: " multiplier on Sunny Day")
                        textRichText(first: "Reach x", last: " in Thunderstorm")
                    }
                    .padding(.leading, 40)
                }
                .foregroundStyle(.level)
            }
            .overlay(alignment: .topTrailing) {
                switch isMenuMode {
                case true:
                    questionButton
                default:
                    plusBoard
                }
            }
            .onAppear {
                confirmed = defaultStorage.level >= level
            }
    }
}

struct Levels: View {
    @EnvironmentObject private var router: Router
    @EnvironmentObject private var defaultStorage: DefaultStorage
    
    var body: some View {
        ZStack {
            ScrollView(showsIndicators: false) {
                ForEach(1...10, id: \.self) { level in
                    LevelBoard(level: level)
                }.padding(.top, 70)
            }
            HStack {
                HomeButon(action: {
                    router.navigate(to: GameViews.menu)
                })
                    .padding(.leading)
                Spacer()
                Wallet()
                    .padding(.trailing)
            }.alignmentPosition(.top)
        }.modifier(AppBackground(.Shop.background))
    }
}

#Preview {
    Levels()
        .environmentObject(DefaultStorage())
        .environmentObject(Router())
}

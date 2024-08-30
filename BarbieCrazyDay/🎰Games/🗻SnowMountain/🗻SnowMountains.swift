//
//  🗻SnowMountains.swift
//  BarbieCrazyDay
//
//  Created by Janiece Eleonour on 29.08.2024.
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
}

struct SnowMountains: View {
    @State var difficultLevelCases: DifficultyLevelCases = .easy
    @EnvironmentObject private var router: Router
    @State private var isPausePresented = false
    @State private var multiplyNumber = 0
    @State private var isDifficltPresented = false
    
    private var betMultipluy: some View {
        Group {
            Text("x") +
            Text(multiplyNumber, format: .number)
        }
        .font(.cherryBombOne(.regular, size: 50))
        .foregroundColor(.white)
        .strokeText(width: 1, color: .shadowPinkColor)
        .shadow(color: .shadowPinkColor, radius: 1, x: 0, y: 5)
    }
    
    var body: some View {
        ZStack {
            betMultipluy
                .alignmentPosition(.top)
                .padding(.top, 45)
            HStack(spacing: 0) {
                PauseButton { isPausePresented = true }
                    .padding(.leading)
                Image(difficultLevelCases.info)
                Spacer()
                Wallet()
                    .padding(.trailing)
            }
            .alignmentPosition(.top)
            BetBoard()
                .alignmentPosition(.bottom)
            
        }.modifier(AppBackground(.Mountains.background))
            .pauseSheet(isPresented: $isPausePresented)
            .fullScreenCover(isPresented: $isDifficltPresented) {
                difficultLevel
                        .presentationBackground(.ultraThinMaterial)
            }
    }
    
    private var difficultLevel: some View {
        VStack {
            Text("Select your\ndifficulty\nlevel:".uppercased())
                .font(.cherryBombOne(.regular, size: 25))
                .foregroundStyle(.white)
                .multilineTextAlignment(.center)
                .shadow(color: .black, radius: 4, x: 0, y: 4)
            ForEach(DifficultyLevelCases.allCases, id: \.self) { difficult in
                Button {
                    difficultLevelCases = difficult
                    isDifficltPresented = false
                } label: {
                    Image(difficult.button)
                }
            }
        }
    }

}

#Preview {
    SnowMountains()
}

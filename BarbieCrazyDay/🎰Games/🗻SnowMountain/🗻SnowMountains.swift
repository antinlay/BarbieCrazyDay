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
    
    private var changeLevel: some View {
        Button {
            isDifficltPresented = true
        } label: {
            Image(difficultLevelCases.info)
        }
    }
    
    var body: some View {
        ZStack {
            VStack {
                HStack(spacing: 0) {
                    PauseButton { isPausePresented = true }
                        .padding(.leading)
                    changeLevel
                    Spacer()
                    Wallet()
                        .padding(.trailing)
                }
                .alignmentPosition(.top)
                gameGrid
                    .alignmentPosition(.center)
                BetBoard()
                    .alignmentPosition(.bottom)
            }
        }.modifier(AppBackground(.Mountains.background))
            .pauseSheet(isPresented: $isPausePresented)
            .fullScreenCover(isPresented: $isDifficltPresented) {
                difficultLevel
                    .presentationBackground(.ultraThinMaterial)
            }
    }
    
    private var gameGrid: some View {
        LazyHGrid(rows: Array(repeating: GridItem(.fixed(60)), count: 8)) {
            ForEach(difficultLevelCases.coefficient, id: \.self) { coefficient in
                rowCoefficient(coefficient, repeate: repeateCoefficient)
            }
        }
    }
    
    private func rowCoefficient(_ coefficient: Double, repeate: Int) -> some View {
        LazyHStack {
            ForEach(Array(repeating: coefficient, count: repeate).indices, id: \.self) { coeff in
                Button {
                    
                } label: {
                    Image(.Mountains.actionButton)
                }
            }
        }
    }
    
    private var repeateCoefficient: Int {
        switch difficultLevelCases {
        case .easy:
            4
        case .hard:
            2
        case .crazy:
            4
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

//
//  🎚️Levels.swift
//  BarbieCrazyDay
//
//  Created by Janiece Eleonour on 27.08.2024.
//

import SwiftUI

struct LevelModel: Hashable {
    var level: Int
    var rich: Double
    var reward: Int
    var confirmed: Bool = false
}

enum Level: CaseIterable {
    case levelOne, levelTwo, levelThree, levelFour, levelFive, levelSix, levelSeven, levelEight, levelNine, levelTen
    
    var value: LevelModel {
        switch self {
        case .levelOne:
            LevelModel(level: 1, rich: 1.5, reward: 1000, confirmed: true)
        case .levelTwo:
            LevelModel(level: 2, rich: 3.5, reward: 2000)
        case .levelThree:
            LevelModel(level: 3, rich: 5, reward: 3000)
        case .levelFour:
            LevelModel(level: 4, rich: 6.5, reward: 4000)
        case .levelFive:
            LevelModel(level: 5, rich: 8, reward: 5000)
        case .levelSix:
            LevelModel(level: 6, rich: 9.5, reward: 6000)
        case .levelSeven:
            LevelModel(level: 7, rich: 11, reward: 7000)
        case .levelEight:
            LevelModel(level: 8, rich: 12.5, reward: 8000)
        case .levelNine:
            LevelModel(level: 9, rich: 14, reward: 9000)
        case .levelTen:
            LevelModel(level: 10, rich: 15.5, reward: 10000)
        }
    }
}

struct LevelBoard: View {
    var levelModel: LevelModel
    var isMenuMode: Bool? = false
    
    @ViewBuilder private func textRichText(first: String, last: String) -> some View {
        let confirmedImage: ImageResource = levelModel.confirmed ? .Levels.on : .Levels.off
        
        HStack {
            Image(confirmedImage)
            Text(first) +
            Text(levelModel.rich, format: .number) +
            Text(last)
        }.font(.cherryBombOne(.regular, size: 12))

    }
    
    @ViewBuilder private var plusBoard: some View {
        let confirmedImage: ImageResource = levelModel.confirmed ? .Levels.done : .Levels.next
        
        Image(.Levels.plusBoard)
            .offset(y: -5)
            .overlay(alignment: .topTrailing) {
                HStack(spacing: 4) {
                    Text("+") +
                    Text(levelModel.reward, format: .number)
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
            // to Levels
        } label: {
            Image(.Menu.question)
                .offset(x: -6, y: -15)
        }
    }
    
    var body: some View {
        Image(.Levels.levelBoard)
            .overlay(alignment: .topLeading) {
                VStack(spacing: 0) {
                    Text("YOUR LEVEL: \(levelModel.level)")
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
    }
}

struct Levels: View {
    @State private var wallet: Int = 10000
    
    var body: some View {
        ZStack {
            ScrollView(showsIndicators: false) {
                ForEach(Level.allCases, id: \.value) { level in
                    LevelBoard(levelModel: level.value)
                }.padding(.top, 70)
            }
            HStack {
                HomeButon(action: {
                    // navigate to home
                })
                    .padding(.leading)
                Spacer()
                amountMoney(wallet)
                    .padding(.trailing)
            }.alignmentPosition(.top)
        }.modifier(AppBackground(.Shop.background))
    }
}

#Preview {
    Levels()
}

//
//  🎲ChestGame.swift
//  BarbieCrazyDay
//
//  Created by Janiece Eleonour on 27.08.2024.
//

import SwiftUI

struct ChestGame: View {
    @EnvironmentObject private var betModel: BetModel
    @Binding var start: Bool
    @State private var isRewardShowing = false
    @State private var chests: [ImageResource] = [.Shop.chest1, .Shop.chest2, .Shop.chest3]
    @State private var rewardRandom: [Int] = Array(repeating: 0, count: 3)
    
    private func rewardButton(_ chest: ImageResource, rewardRandom: Int) -> some View {
        Button {
            withAnimation {
                betModel.deposit(amount: rewardRandom)
                isRewardShowing = true
                start = false
            }
        } label: {
            Image(chest)
                .colorMultiply(isRewardShowing || start ? .white : .gray)
                .overlay {
                    Group {
                        Image(.Shop.almaz)
                        Text(rewardRandom, format: .number)
                            .font(.cherryBombOne(.regular, size: 18))
                            .foregroundStyle(.white)
                    }
                    .opacity(isRewardShowing ? 1 : .zero)
                }
        }
    }
    
    init(start: Binding<Bool>) {
        self._start = start
    }
    
    var body: some View {
        HStack {
            ForEach(Array(chests.shuffled().enumerated()).prefix(3), id: \.offset) { index, chest in
                rewardButton(chest, rewardRandom: rewardRandom[index])
                    .disabled(!start)
                    .padding(.bottom, index == 1 ? 30 : 0)
            }
        }
        .onChange(of: start) { newValue in
            if newValue {
                chests = [.Shop.chest1, .Shop.chest2, .Shop.chest3, .Shop.chest4, .Shop.chest5, .Shop.chest6]
                rewardRandom = [Int.random(in: 100...5000), Int.random(in: 100...5000), Int.random(in: 100...5000)]
            }
        }
    }
}

#Preview {
    ChestGame(start: .constant(true))
        .environmentObject(DefaultStorage())
}

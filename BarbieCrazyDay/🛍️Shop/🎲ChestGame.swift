//
//  🎲ChestGame.swift
//  BarbieCrazyDay
//
//  Created by Janiece Eleonour on 27.08.2024.
//

import SwiftUI

struct ChestGame: View {
    @State var start: Bool
    @State private var wallet = 10_000
    @State var isRewardShowing = false
    private var chests: Set<ImageResource> = [.Shop.chest1, .Shop.chest2, .Shop.chest3, .Shop.chest4, .Shop.chest5, .Shop.chest6]
    
    init(start: Bool) {
        self.start = start
    }
    
    @ViewBuilder private func rewardButton(_ chest: ImageResource) -> some View {
        let random = Int.random(in: 100...5000)
        
        Button {
            withAnimation {
                wallet += random
                isRewardShowing = true
                start = false
            }
        } label: {
            Image(chest)
                .colorMultiply(isRewardShowing || start ? .white : .gray)
                .overlay {
                    Group {
                        Image(.Shop.almaz)
                        Text(random, format: .number)
                            .font(.cherryBombOne(.regular, size: 18))
                            .foregroundStyle(.white)
                    }
                    .opacity(isRewardShowing ? 1 : .zero)
                }
        }
    }
    
    var body: some View {
        LazyHStack {
            ForEach(Array(chests.enumerated()).prefix(3), id: \.offset) { index, chest in
                rewardButton(chest)
                    .disabled(!start)
                    .padding(.bottom, index == 1 ? 30 : 0)
            }
        }
    }
}

#Preview {
    ChestGame(start: true)
}

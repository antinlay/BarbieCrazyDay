//
//  🎲ChestGame.swift
//  BarbieCrazyDay
//
//  Created by Janiece Eleonour on 27.08.2024.
//

import SwiftUI

struct ChestGame: View {
    @EnvironmentObject private var defaultStorage: DefaultStorage
    @Binding var start: Bool
    @State private var isRewardShowing = false
    private var chests: Set<ImageResource> = [.Shop.chest1, .Shop.chest2, .Shop.chest3, .Shop.chest4, .Shop.chest5, .Shop.chest6]
    
    @ViewBuilder private func rewardButton(_ chest: ImageResource) -> some View {
        let random = Int.random(in: 100...5000)
        
        Button {
            withAnimation {
                defaultStorage.wallet += random
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
    
    init(start: Binding<Bool>) {
        self._start = start
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
    ChestGame(start: .constant(true))
        .environmentObject(DefaultStorage())
}

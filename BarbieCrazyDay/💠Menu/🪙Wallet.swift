//
//  🪙Wallet.swift
//  BarbieCrazyDay
//
//  Created by Janiece Eleonour on 28.08.2024.
//

import SwiftUI

struct Wallet: View {
    @EnvironmentObject private var betModel: BetModel

    var body: some View {
        HStack(spacing: 4) {
            Text(betModel.wallet, format: .number)
                .font(.cherryBombOne(.regular, size: 15))
                .foregroundStyle(.accent)
                .shadow(color: .fontShadow, radius: 4, x: 0, y: 4)
            Image(.Menu.almaz)
        }
        .walletBackground
    }
}

#Preview {
    Wallet()
}

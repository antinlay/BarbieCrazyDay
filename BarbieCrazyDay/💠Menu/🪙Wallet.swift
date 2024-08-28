//
//  🪙Wallet.swift
//  BarbieCrazyDay
//
//  Created by Janiece Eleonour on 28.08.2024.
//

import SwiftUI

struct Wallet: View {
    @AppStorage(DefaultStorage.Key.wallet.rawValue) private var wallet = 10_000
    
    var body: some View {
        Image(.Menu.amount)
            .overlay {
                HStack(spacing: 4) {
                    Text(wallet, format: .number)
                        .font(.cherryBombOne(.regular, size: 15))
                        .foregroundStyle(.accent)
                        .shadow(color: .fontShadow, radius: 4, x: 0, y: 4)
                    Image(.Menu.almaz)
                }
            }
    }
}

#Preview {
    Wallet()
}

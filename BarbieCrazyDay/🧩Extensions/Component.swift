//
//  Component.swift
//  BarbieCrazyDay
//
//  Created by Janiece Eleonour on 27.08.2024.
//

import SwiftUI

public func amountMoney(_ wallet: Int) -> some View {
    Image(.Menu.amount)
        .overlay {
            HStack(spacing: 4) {
                Text("\(wallet)")
                    .font(.cherryBombOne(.regular, size: 15))
                    .foregroundStyle(.accent)
                    .shadow(color: .fontShadow, radius: 4, x: 0, y: 4)
                Image(.Menu.almaz)
            }
        }
}

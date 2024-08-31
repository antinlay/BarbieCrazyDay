//
//  🏆Winner.swift
//  BarbieCrazyDay
//
//  Created by Janiece Eleonour on 01.09.2024.
//

import SwiftUI

enum WinnerCase {
    case winner, victory
    
    var value: ImageResource {
        switch self {
        case .winner:
                .Thunderstorm.winner
        case .victory:
                .SunnyDay.victory
        }
    }
}

struct Winner: View {
    @EnvironmentObject private var router: Router
    var background: ImageResource = .SunnyDay.background
    var winnerCase: WinnerCase = .victory
    
    var body: some View {
        ZStack {
            Image(.SunnyDay.confetti)
                .alignmentPosition(.top)
                .ignoresSafeArea()
            Rectangle()
                .fill(Color.white.opacity(0.65))
                .blur(radius: 122)
            VStack(spacing: 50) {
                Image(winnerCase.value)
                Wallet()
            }
            LongHomeButon { router.navigate(to: .menu) }
                .alignmentPosition(.bottomTrailing)
                .padding(.trailing)
            Image(.Stories.barbie)
                .alignmentPosition(.bottomLeading)
                .ignoresSafeArea()
        }.modifier(AppBackground(background))
    }
}

#Preview {
    Winner()
}

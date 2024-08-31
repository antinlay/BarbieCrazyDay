//
//  🎰Games.swift
//  BarbieCrazyDay
//
//  Created by Janiece Eleonour on 31.08.2024.
//

import SwiftUI

struct Games: View {
    @EnvironmentObject private var router: Router
    
    var body: some View {
        ZStack {
            HStack {
                HomeButon(action: {  router.navigate(to: GameViews.menu) })
                .padding(.leading)
                Spacer()
                Wallet()
                    .padding(.trailing)
            }
            .alignmentPosition(.top)
            Image(.Games.barbie)
                .alignmentPosition(.bottomTrailing)
                .ignoresSafeArea()
            VStack(alignment: .leading) {
                Button {
                    router.navigate(to: GameViews.sunnyDay)
                } label: {
                    Image(.Games.sunnyDayButton)
                }
                Button {
                    router.navigate(to: GameViews.mountains)
                } label: {
                    Image(.Games.snowButton)
                        .padding(.leading, 28)
                }

                Button {
                    router.navigate(to: GameViews.thundershtorm)
                } label: {
                    Image(.Games.thanderStormButton)
                }
            }
            .padding(.bottom, 74)
            .padding(.leading, 24)
            .alignmentPosition(.bottomLeading)

        }.modifier(AppBackground(.Menu.background))
    }
}

#Preview {
    Games()
}

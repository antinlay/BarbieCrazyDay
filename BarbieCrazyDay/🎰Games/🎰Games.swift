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
            fullScreenBackground(.Menu.background)
            
            VStack(alignment: .leading) {
                HStack {
                    HomeButon {  router.navigate(to: GameViews.menu) }
                        .padding(.leading)
                    Spacer()
                    Wallet()
                        .padding(.trailing)
                }
                Spacer()
                ZStack {
                    Image(.Games.barbie)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: .infinity, alignment: .bottomTrailing)
                        .ignoresSafeArea(edges: .bottom)
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
                    .frame(maxWidth: .infinity, alignment: .bottomLeading)
                    .padding(.horizontal, 24)
                    .offset(y: 90)
                }
            }
        }
    }
}

#Preview {
    Games()
}

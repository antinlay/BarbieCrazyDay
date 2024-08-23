//
//  👋🏼Welcome.swift
//  BarbieCrazyDay
//
//  Created by Janiece Eleonour on 23.08.2024.
//

import SwiftUI

struct Welcome: View {
    var body: some View {
        ZStack {
            Image(.Welcome.barbie)
                .modifier(AlignmentPosition(.bottomLeading))
            Image(.Welcome.cloud)
                .overlay(alignment: .top) {
                    Group {
                        VStack(spacing: -10) {
                            Text("HI!")
                                .font(.cherryBombOne(.regular, size: 50))
                                .foregroundStyle(.accent)
                            Text("My name is\nAyna!")
                                .font(.cherryBombOne(.regular, size: 16))
                                .multilineTextAlignment(.center)
                                .foregroundStyle(.white)
                        }
                    }
                    .rotationEffect(.degrees(-15))
                    .shadow(color: .black, radius: 4, x: 0, y: 4)
                }
                .modifier(AlignmentPosition(.topTrailing))
                .padding(.top, 165)
                .padding(.trailing, 20)
            RoundedRectangle(cornerRadius: 33)
                .fill(Color.actionGradient.opacity(0.65))
                .overlay(
                    RoundedRectangle(cornerRadius: 33)
                        .stroke(.white, style: StrokeStyle(lineWidth: 7, lineCap: .round, lineJoin: .round, dash: [10, 15]))
                    )
                .frame(maxWidth: .infinity, maxHeight: 142)
                .padding(.horizontal)

        }.modifier(AppBackground(.Welcome.background))
    }
}

#Preview {
    Welcome()
}

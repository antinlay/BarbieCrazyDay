//
//  RowButtons.swift
//  BarbieCrazyDay
//
//  Created by Janiece Eleonour on 02.09.2024.
//

import SwiftUI

struct RowButtons: View {
    @Binding var rowIndex: Int
    @EnvironmentObject private var betModel: BetModel
    @State private var isOpen = false
    @State private var items: [ImageResource] = []
    var difficult: DifficultyLevelCases
    
    var placeholder: ImageResource = .Mountains.actionButton
    
    var action: () -> Void
    
    private var betMultiply: some View {
        Group {
            Text("x") +
            Text(difficult.coefficient[rowIndex], format: .number)
        }
        .font(.cherryBombOne(.regular, size: 25))
        .foregroundColor(.white)
        .strokeText(width: 0.5, color: .shadowPinkColor)
        .shadow(color: .shadowPinkColor, radius: 0.5, x: 0, y: 5)
    }
    
    var body: some View {
        LazyHStack(spacing: 0) {
            ForEach(items, id: \.self) { item in
                Button {
                    isOpen = true
                    if item == .SunnyDay.bomb {
                        rowIndex = 7
                        betModel.raiseCoefficient(coefficient: 0)
                    } else {
                        betModel.raiseCoefficient(coefficient: difficult.coefficient[rowIndex])
                        action()
                    }
                } label: {
                    ZStack {
                        Group{
                            Image(item)
                            betMultiply
                        }
                        .opacity(isOpen ? 1 : 0)
                        Image(placeholder)
                            .opacity(isOpen ? 0 : 1)
                    }
                    .scaleEffect(isOpen ? 1.3 : 1)
                }
                .disabled(isOpen)
            }
        }
        .onChange(of: betModel.isGameStarted) { newValue in
            items = difficult.items
            withAnimation {
                if !newValue {
                    isOpen = false
                }
            }
        }
    }
}

#Preview {
    RowButtons(rowIndex: .constant(0), difficult: .easy) {
        
    }
    .environmentObject(BetModel())
}

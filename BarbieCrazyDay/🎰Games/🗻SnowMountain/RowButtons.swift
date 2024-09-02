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
    
    var body: some View {
        LazyHStack(spacing: 0) {
            ForEach(items, id: \.self) { item in
                Button {
                    isOpen = true
                    if item == .Mountains.bomb {
                        withAnimation {
                            rowIndex = 7
                            betModel.raiseCoefficient(coefficient: 0)
                            betModel.isGameStarted = false
                        }
                    } else {
                        betModel.raiseCoefficient(coefficient: difficult.coefficient[rowIndex])
                        action()
                    }
                } label: {
                    ZStack {
                        Group{
                            Image(item)
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
            withAnimation(.bouncy) {
                items = difficult.items
            }
            if !newValue {
                isOpen = false
            }
        }
    }
}

#Preview {
    RowButtons(rowIndex: .constant(0), difficult: .easy) {
        
    }
    .environmentObject(BetModel())
}

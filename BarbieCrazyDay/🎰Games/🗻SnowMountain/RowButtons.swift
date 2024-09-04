//
//  RowButtons.swift
//  BarbieCrazyDay
//
//  Created by Janiece Eleonour on 02.09.2024.
//

import SwiftUI

struct RowButtons: View {
    @Binding var difficult: DifficultyLevelCases
    @Binding var rowIndex: Int
    @EnvironmentObject private var betModel: BetModel
    @State private var isOpen = false
    @State private var items: [ImageResource] = []
    
    var placeholder: ImageResource = .Mountains.actionButton
    
    var action: () -> Void
    
    var body: some View {
        HStack(spacing: 0) {
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
                        Image(item)
                            .opacity(isOpen ? 1 : 0)
                        Image(placeholder)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .opacity(isOpen ? 0 : 1)
                    }
                    .scaleEffect(isOpen ? 1.3 : 1)
                }
                .disabled(isOpen)
            }
        }
        .onChange(of: difficult) { _ in
            fillingItems()
        }
        .onAppear {
            fillingItems()
        }
        .onChange(of: betModel.isGameStarted) { newValue in
            fillingItems()
            if !newValue {
                isOpen = false
            }
        }
    }
    
    private func fillingItems() {
        withAnimation(.bouncy) {
            items = difficult.items
        }
    }
}

#Preview {
    RowButtons(difficult: .constant(.easy), rowIndex: .constant(0)) {
        
    }
    .environmentObject(BetModel())
}

//
//  SpinItems.swift
//  BarbieCrazyDay
//
//  Created by Janiece Eleonour on 02.09.2024.
//

import SwiftUI

struct SpinItems: View {
    @Binding var stepSpin: SunnyDayCases
    @EnvironmentObject private var betModel: BetModel
    var action: () -> Void
    @State private var items: [ImageResource] = []
    @State private var spinOffset: Double = 0
    @State private var isDisabled = false
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 0) {
                ForEach(Array(items.enumerated()), id: \.offset) { index, item in
                    Image(item)
                }
                .offset(y: spinOffset)
            }
        }
        .frame(height: 190)
        .onTapGesture {
            isDisabled = true
            withAnimation(.bouncy(duration: 2)) {
                spinOffset = -2239
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                withAnimation {
                    if items.suffix(5).prefix(3).contains(stepSpin.item) {
                        betModel.raiseCoefficient(coefficient: stepSpin.coefficient)
                        stepSpin = stepSpin.next
                    } else {
                        betModel.raiseCoefficient(coefficient: 0)
                        stepSpin = .first
                    }
                    action()
                }
            }
        }
        .disabled(isDisabled)
        .onChange(of: betModel.isGameStarted) { newValue in
            if newValue {
                withAnimation(.bouncy(duration: 1)) {
                    spinOffset = 0
                    items = randomArray
                    isDisabled = false
                }
            }
        }
    }
    
    private var randomArray: [ImageResource] {
        let items: [ImageResource] = [.SunnyDay.bomb, .SunnyDay.brilliant, .SunnyDay.orange, .SunnyDay.emerald, .SunnyDay.love]
        let randomItems = Array(repeating: items[0], count: 20) + Array(repeating: items[1], count: 5) + Array(repeating: items[2], count: 5) + Array(repeating: items[3], count: 5) + Array(repeating: items[4], count: 5)
        
        return randomItems.shuffled()
    }
}

#Preview {
    SpinItems(stepSpin: .constant(.first)) {
        
    }
    .environmentObject(BetModel())
}

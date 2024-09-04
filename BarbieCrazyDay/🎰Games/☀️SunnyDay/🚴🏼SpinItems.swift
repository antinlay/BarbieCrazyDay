//
//  SpinItems.swift
//  BarbieCrazyDay
//
//  Created by Janiece Eleonour on 02.09.2024.
//

import SwiftUI

struct SpinItems: View {
    var index: Int
    @Binding var stepSpin: SunnyDayCases
    @Binding var isSpin: Bool
    @EnvironmentObject private var betModel: BetModel
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
        .onChange(of: isSpin) { newValue in
            if newValue, index == stepSpin.step {
                reset()
                withAnimation(.bouncy(duration: 2)) {
                    spinOffset = -2239
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    withAnimation {
                        if items.suffix(5).prefix(3).contains(stepSpin.item) {
                            betModel.multiplyNumber += stepSpin.coefficient
                            betModel.stepSpin = stepSpin.next.step
                        } else {
                            betModel.raiseCoefficient(coefficient: 0)
                            stepSpin = .first
                        }
                        isSpin = false
                    }
                }
            }
        }
        .onChange(of: betModel.isGameStarted) { newValue in
            if newValue {
                reset()
            }
        }
    }
    
    private func reset() {
        //        withAnimation(.bouncy(duration: 1)) {
        spinOffset = 0
        items = randomArray
        //        }
    }
    
    private var randomArray: [ImageResource] {
        let items: [ImageResource] = [.SunnyDay.bomb, .SunnyDay.brilliant, .SunnyDay.orange, .SunnyDay.emerald, .SunnyDay.love]
        let randomItems = Array(repeating: items[0], count: 20) + Array(repeating: items[1], count: 5) + Array(repeating: items[2], count: 5) + Array(repeating: items[3], count: 5) + Array(repeating: items[4], count: 5)
        
        return randomItems.shuffled()
    }
}

#Preview {
    SpinItems(index: 0, stepSpin: .constant(.first), isSpin: .constant(.random()))
    .environmentObject(BetModel())
}

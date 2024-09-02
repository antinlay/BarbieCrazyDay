//
//  SpinItems.swift
//  BarbieCrazyDay
//
//  Created by Janiece Eleonour on 02.09.2024.
//

import SwiftUI

struct SpinItems: View {
    @Binding var stepSpin: SunnyDaysCases
    @EnvironmentObject private var betModel: BetModel
    var action: () -> Void
    @State private var items: [ImageResource] = []
    
    var body: some View {
        VStack(spacing: 0) {
            ForEach(Array(items.enumerated()), id: \.offset) { index, item in
                Image(item)
            }
        }
        .onTapGesture {
            withAnimation {
                items = randomArray
            }
            if items.contains(stepSpin.item) {
                betModel.raiseCoefficient(coefficient: stepSpin.coefficient)
                stepSpin = stepSpin.next
            } else {
                betModel.raiseCoefficient(coefficient: 0)
                stepSpin = .first
            }
            action()
        }
        .onAppear {
            items = randomArray
        }
    }
    
    private var randomArray: [ImageResource] {
        let items: [ImageResource] = [.SunnyDay.bomb, .SunnyDay.brilliant, .SunnyDay.orange, .SunnyDay.emerald, .SunnyDay.love]
        
        return [items.randomElement()!, items.randomElement()!, items.randomElement()!]
    }
}

#Preview {
    SpinItems(stepSpin: .constant(.first)) {
        
    }
}

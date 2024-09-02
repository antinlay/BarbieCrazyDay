//
//  SpinItems.swift
//  BarbieCrazyDay
//
//  Created by Janiece Eleonour on 02.09.2024.
//

import SwiftUI

struct SpinItems: View {
    @State private var isSpinning = false
    @State private var selectedItem: Int?
    @State private var items: [ImageResource] = [.SunnyDay.bomb, .SunnyDay.brilliant, .SunnyDay.orange, .SunnyDay.emerald, .SunnyDay.love]
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVStack(spacing: 0) {
                ForEach(0..<100, id: \.self) { _ in
                    ForEach(0..<5, id: \.self) { index in
                        Image(items[index])
                    }
                }
            }
        }
    }
}

#Preview {
    SpinItems()
}

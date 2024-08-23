//
//  Color.swift
//  BarbieCrazyDay
//
//  Created by Janiece Eleonour on 23.08.2024.
//

import SwiftUI

extension Color {
    static var actionGradient: LinearGradient {
        LinearGradient(
            gradient: Gradient(colors: [Color(#colorLiteral(red: 0.495, green: 0, blue: 0.883, alpha: 1)), Color(#colorLiteral(red: 0.889, green: 0, blue: 0.967, alpha: 1))]),
            startPoint: .top,
            endPoint: .bottom
        )
    }
}

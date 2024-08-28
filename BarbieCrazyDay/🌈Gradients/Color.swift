//
//  Color.swift
//  BarbieCrazyDay
//
//  Created by Janiece Eleonour on 23.08.2024.
//

import SwiftUI

extension Color {
    static var descriptionGradient: LinearGradient {
        LinearGradient(
            gradient: Gradient(colors: [Color(#colorLiteral(red: 0.49, green: 0, blue: 0.882, alpha: 1)), Color(#colorLiteral(red: 0.889, green: 0, blue: 0.964, alpha: 1))]),
            startPoint: .top,
            endPoint: .bottom
        )
    }
    
    static var vignetteGradient: RadialGradient {
        RadialGradient(
            gradient: Gradient(colors: [Color.clear, Color(#colorLiteral(red: 0.495, green: 0, blue: 0.883, alpha: 1))]),
            center: .center,
            startRadius: 0,
            endRadius: 66
        )
    }
}

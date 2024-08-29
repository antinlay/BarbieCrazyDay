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
    
    static var betBoardGradient: LinearGradient {
        LinearGradient(
            gradient: Gradient(colors: [Color(#colorLiteral(red: 0, green: 0.085, blue: 0.85, alpha: 1)), Color(#colorLiteral(red: 0.904, green: 0, blue: 0.814, alpha: 1))]),
            startPoint: .top,
            endPoint: .bottom
        )
    }
    
    static var shadowPinkColor = Color(#colorLiteral(red: 0.89, green: 0, blue: 0.965, alpha: 1))
}

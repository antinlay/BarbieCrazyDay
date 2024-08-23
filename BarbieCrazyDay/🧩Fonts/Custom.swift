//
//  Custom.swift
//  BarbieCrazyDay
//
//  Created by Janiece Eleonour on 23.08.2024.
//

import SwiftUI

enum CherryBombOne: String {
//    case thin = "Thin"
//    case extraLight = "ExtraLight"
//    case light = "Light"
    case regular = "Regular"
//    case medium = "Medium"
//    case semibold = "SemiBold"
//    case bold = "Bold"
//    case extraBold = "ExtraBold"
//    case black = "Black"
}

extension Font {
    static func cherryBombOne(_ weight: CherryBombOne, size: CGFloat, isItalic: Bool = false) -> Font {
        Font.custom("CherryBombOne-\(weight.rawValue)" + (isItalic ? "Italic" : "") , size: size)
    }
}

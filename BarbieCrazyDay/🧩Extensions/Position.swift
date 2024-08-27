//
//  Position.swift
//  BarbieCrazyDay
//
//  Created by Janiece Eleonour on 23.08.2024.
//

import SwiftUI

public struct AlignmentPosition: ViewModifier {
    let alignment: Alignment
    
    public init(_ alignment: Alignment) {
        self.alignment = alignment
    }
    
    public func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: alignment)
    }
}

extension View {
    public func alignmentPosition(_ alignment: Alignment) -> some View {
        modifier(AlignmentPosition(alignment))
    }
}

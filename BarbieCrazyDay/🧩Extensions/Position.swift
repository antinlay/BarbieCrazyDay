//
//  Position.swift
//  BarbieCrazyDay
//
//  Created by Janiece Eleonour on 23.08.2024.
//

import SwiftUI

struct AlignmentPosition: ViewModifier {
    let alignment: Alignment
    
    init(_ alignment: Alignment) {
        self.alignment = alignment
    }
    
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: alignment)
    }
}

extension View {
    public func alignmentPosition(_ alignment: Alignment) -> some View {
        modifier(AlignmentPosition(alignment))
    }
}

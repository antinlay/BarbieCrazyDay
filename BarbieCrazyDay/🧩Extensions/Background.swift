//
//  Background.swift
//  BarbieCrazyDay
//
//  Created by Janiece Eleonour on 23.08.2024.
//

import SwiftUI

struct AppBackground: ViewModifier {
    let imageResource: ImageResource
    
    init(_ imageResource: ImageResource) {
        self.imageResource = imageResource
    }
    
    func body(content: Content) -> some View {
        content
            .background { Image(imageResource).resizable() }.ignoresSafeArea()
    }
}

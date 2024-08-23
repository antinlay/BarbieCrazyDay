//
//  ContentView.swift
//  BarbieCrazyDay
//
//  Created by Janiece Eleonour on 23.08.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8)
                .fill(Color(red: 0, green: 1, blue: 0.22))
                .shadow(color: Color(red: 0, green: 0.843, blue: 0.184), radius: 5)
                .shadow(color: Color(red: 0, green: 0.843, blue: 0.184), radius: 3)
            LinearGradient(gradient: Gradient(colors: [Color.clear, Color.black]), startPoint: .top, endPoint: .bottom)
                .opacity(0.35)
            Image(.barbie)

        }
        .frame(width: 200, height: 200)
        .padding(.leading, 16)
        .padding(.top, 45)
    }
}

#Preview {
    ContentView()
}

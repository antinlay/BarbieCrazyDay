//
//  BetModel.swift
//  BarbieCrazyDay
//
//  Created by Janiece Eleonour on 01.09.2024.
//

import SwiftUI

final class BetModel: ObservableObject {
    @AppStorage(DefaultStorage.Key.wallet.rawValue) private var wallet = 10_000
    @Published var isGameStarted = false
    @Published var bet: Int?
    @Published var multiplyNumber: Double = 0
    
    var minBet = 1000
    var maxBet = 10_000
    
    var currentWinning: Int { Int(Double(bet!) * multiplyNumber) }
    
    func takeButtonPressed() {
        wallet += Int(Double(bet!) * multiplyNumber)
        isGameStarted = false
    }
    
    func dealButtonPressed() {
        wallet -= bet!
        isGameStarted = true
    }
    
    
}
